function [ v ] = lp( d, t )
%   LP Linear Perceptron algorithm
%   Fill in your codes here.
%	  Author: Linpeng Lyu (Andrew ID: linpengl)

% training data matrix for class 2 and 3
d23 = d(find(d(:, 3) ~= 1), :);
d2 = d(find(d(:, 3) == 2), :);
d3 = d(find(d(:, 3) == 3), :);

% Data feature space, label, step size and initial weight vector
feature = [d23(:, 1:2), ones(length(d23), 1)];
label = d23(:, 3);
a = 0.005;
w = [0, 1, 0];

% Optimize weight vector
for i = 1 : length(d23)
    sign = (w * feature(i, :)' > 0) + 2;
    if (sign ~= label(i))
        w = w + (label(i) - sign) * feature(i, :) * a;
    endif 
endfor
%Predict label of test data
test_feature = [t, ones(length(t), 1)];
v = (test_feature * w' > 0) +2;
%v = test_feature * w';

% Plot points and decision boundary
hold on;
scatter(d2(:, 1), d2(:, 2), 'r', '*');
scatter(d3(:, 1), d3(:, 2), 'g', '*');
yy = -w(1) .* d23(:, 1) ./ w(2) - w(3) / w(2);
line(d23(:, 1), yy);
hold off;
end

