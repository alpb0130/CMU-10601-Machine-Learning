function [ v ] = nb( d, t )
%   Naive Bayes algorithm
%   Fill in your codes here.

% training data matrix for class 1 and 2
d12 = d(find(d(:,3)~=3), :);
d1 = d(find(d(:,3)==1), :);
d2 = d(find(d(:,3)==2), :);

% Prior for class 1 and class 2. They are double type numbers.
prior1 = length(d1) / length(d12);
prior2 = length(d2) / length(d12);

% Parameter of Guassian distribution for class 1. They are double type numbers.
u1x = mean(d1(:, 1));
t1x = mean((d1(:, 1) - u1x) .^ 2);
u1y = mean(d1(:, 2));
t1y = mean((d1(:, 2) - u1y) .^ 2);

% Parameter of Guassian distribution for class 2. They are double type numbers.
u2x = mean(d2(:, 1));
t2x = mean((d2(:, 1) - u2x) .^ 2);
u2y = mean(d2(:, 2));
t2y = mean((d2(:, 2) - u2y) .^ 2);

% Probability of Guassian Distribution for class 1 and class 2. They are vectors of length(t)
p1x = sqrt(1 / (2 * pi * t1x)) * exp(-(t(:, 1) - u1x) .^ 2 / (2 * t1x));
p1y = sqrt(1 / (2 * pi * t1y)) * exp(-(t(:, 2) - u1y) .^ 2 / (2 * t1y));
p2x = sqrt(1 / (2 * pi * t2x)) * exp(-(t(:, 1) - u2x) .^ 2 / (2 * t2x));
p2y = sqrt(1 / (2 * pi * t2y)) * exp(-(t(:, 2) - u2y) .^ 2 / (2 * t2y));

% Probability of given data for class 1 and 2
pv1 = p1x .* p1y * prior1 ./ (p1x .* p1y * prior1 + p2x .* p2y * prior2);
pv2 = p2x .* p2y * prior2 ./ (p1x .* p1y * prior1 + p2x .* p2y * prior2);

% Prediction
v = ones(length(t),1) + (pv1 < pv2);

end