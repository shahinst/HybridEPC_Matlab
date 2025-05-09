function mutated = gaussian_mutation(parent, VarMin, VarMax)
sigma = 0.1 * (VarMax - VarMin);
mutated = parent + sigma * randn(size(parent));
mutated = max(min(mutated, VarMax), VarMin);
end
