function [child1, child2] = arithmetic_crossover(parent1, parent2)
alpha = rand(size(parent1));
child1 = alpha .* parent1 + (1 - alpha) .* parent2;
child2 = alpha .* parent2 + (1 - alpha) .* parent1;
end
