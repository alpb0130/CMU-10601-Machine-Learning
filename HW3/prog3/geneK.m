function K = geneK(X, Y)

[m n] = size(X);
K= zeros(m, m);
for i = 1: m
  for j = 1 : m
    K(i, j) = Y(i) * Y(j) * X(i, :) * X(j, :)';
    endfor
endfor