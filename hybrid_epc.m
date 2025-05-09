function BestSol = hybrid_epc(CostFunction, nVar, VarMin, VarMax, nPop, MaxIter, CrossoverRate, MutationRate)

% Parameters
a = 0.2; 
b = 0.5;
Q_init = 0.2;
attenuation = 1;
Q_damp = 0.9995;
attenuation_damp = 0.9998;
mutation_damp = 0.02;

% Empty individual structure
empty_ind.Position = [];
empty_ind.Cost = [];

% Initialize population
pop = repmat(empty_ind, nPop, 1);
for i = 1:nPop
    pop(i).Position = unifrnd(VarMin, VarMax, [1 nVar]);
    pop(i).Cost = CostFunction(pop(i).Position);
end

% Main loop
for iter = 1:MaxIter
    new_pop = pop;

    % Spiral movement phase
    for i = 1:nPop
        for j = 1:nPop
            if pop(j).Cost < pop(i).Cost
                d = norm(pop(j).Position - pop(i).Position);
                Q = Q_init * exp(-attenuation * d);

                % Generate spiral-like offset for high-dimensional vector
                r = a * exp(b * Q);
                offset = r * randn(1, nVar);  % <--- FIXED for nVar dimension

                % New position + random mutation
                new_pos = pop(i).Position + offset + Q_init * randn(1, nVar);
                new_pos = max(min(new_pos, VarMax), VarMin);  % Clipping bounds
                new_cost = CostFunction(new_pos);

                if new_cost < new_pop(i).Cost
                    new_pop(i).Position = new_pos;
                    new_pop(i).Cost = new_cost;
                end
            end
        end
    end

    % Crossover
    Nc = round(CrossoverRate * nPop / 2) * 2;
    popc = repmat(empty_ind, Nc, 1);
    for k = 1:2:Nc
        i1 = randi([1 nPop]);
        i2 = randi([1 nPop]);
        [popc(k).Position, popc(k+1).Position] = arithmetic_crossover(pop(i1).Position, pop(i2).Position);
        popc(k).Cost = CostFunction(popc(k).Position);
        popc(k+1).Cost = CostFunction(popc(k+1).Position);
    end

    % Mutation
    Nm = round(MutationRate * nPop);
    popm = repmat(empty_ind, Nm, 1);
    for k = 1:Nm
        i = randi([1 nPop]);
        popm(k).Position = gaussian_mutation(pop(i).Position, VarMin, VarMax);
        popm(k).Cost = CostFunction(popm(k).Position);
    end

    % Merge all populations
    pop = [pop; new_pop; popc; popm];
    [~, idx] = sort([pop.Cost]);
    pop = pop(idx);
    pop = pop(1:nPop);
    BestSol = pop(1);

    % Decay parameters
    Q_init = Q_init * Q_damp;
    attenuation = attenuation * attenuation_damp;
end
end
