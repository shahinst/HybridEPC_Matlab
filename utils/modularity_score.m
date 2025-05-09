function Q = modularity_score(A, labels)
m = sum(A(:)) / 2;
Q = 0;
for c = unique(labels)
    idx = find(labels == c);
    Lc = sum(sum(A(idx, idx)));
    Kc = sum(sum(A(idx, :)));
    Q = Q + (Lc / (2*m)) - (Kc / (2*m))^2;
end
Q = -Q;  % Negative because we minimize in the optimization
end
