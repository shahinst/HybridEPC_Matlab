clc; clear; close all;

% Example 1: Benchmark test (Sphere)
% CostFunction = @sphere_func;
% nVar = 30;
% VarMin = -5.12; VarMax = 5.12;

% Example 2: Community detection on Zachary network
load('datasets/zachary_adj_matrix.mat');  % Load adjacency matrix
CostFunction = @(x) modularity_score(A, round(x));  % Modularity cost
nVar = size(A,1);
VarMin = 2;
VarMax = max(4, round(nVar/2));

nPop = 100;
MaxIter = 200;
CrossoverRate = 0.7;
MutationRate = 0.2;

BestSol = hybrid_epc(CostFunction, nVar, VarMin, VarMax, nPop, MaxIter, CrossoverRate, MutationRate);
disp(['Best Cost: ', num2str(BestSol.Cost)]);

% Plot results with different visualization options
plot_graph_result(A, BestSol.Position, 'all');  % Shows all visualization types
