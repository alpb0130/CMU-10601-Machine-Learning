function [ v ] = lpexample( d, t )
%   LP Linear Perceptron algorithm
%   Fill in your codes here.
%	  Author: Linpeng Lyu (Andrew ID: linpengl)

% training data matrix for class 2 and 3
d23 = d(find(d(:, 3) ~= 1), :);
d2 = d(find(d(:, 3) == 2), :);
d3 = d(find(d(:, 3) == 3), :);

w = [0, 1, 0];

[m, n] = size(d);
v = zeros(m, 1);

d(find(d(:, 3) == 2), 3) = 1;
d(find(d(:, 3) == 3), 3) = -1;

for i = 1 : m
	curX = d(i, 1);
	curY = d(i, 2);
	curL = d(i, 3);
	
	if sign([curX, curY, 1] *  w') ~= curL
		w = w + curL * [curX, curY, 1] * 0.005;
	end
end

[m, n] = size(t);
v = zeros(m, 1);

for i = 1 : m
	curX = t(i, 1);
	curY = t(i, 2);

	if sign([curX, curY, 1] * w') == 1
		v(i) = 2;
	else
		v(i) = 3;
	end
end

% Plot points and decision boundary
hold on;
scatter(d2(:, 1), d2(:, 2), 'r', '*');
scatter(d3(:, 1), d3(:, 2), 'g', '*');
yy = -w(1) .* d23(:, 1) ./ w(2) - w(3) / w(2);
line(d23(:, 1), yy);
hold off;

end