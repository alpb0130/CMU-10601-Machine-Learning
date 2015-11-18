
% 10601A/SV-F15: Introduction to Machine Learning
% Programming Assignment 3: Support Vector Machine with Newton's Method
%
% TASK 2: Write a routine that implements Newton's Method 
% 			 to solve dual-form support vector machine.
% ============================================================ 
% INPUT   K: the kernel matrix;
%			 C: a column vector that contains the upper bounds; 
%         params: 
%				params.epsilon: the solution accuracy;
% 				params.maxiter: the maximum number of iterations;
%           params.barrier: the multiplicative factor. 
% ============================================================ 
% OUTPUT  alpha: a column vector that contains the optimal coefficients. 

function alpha = svm(K, C, params)
	alpha = zeros(size(K, 1), 1);
  
  % initialize alpha, mu, epsilon, Nmax and barrier (b) 
  alpha = C ./ 2;
  mu = 1000 * mean(diag(K));
  epsilon = params.epsilon;
  Nmax = params.maxiter;
  b = params.barrier;
  beta = 0.667;
  i = 0;
  I = ones(size(alpha));
  
  % Newton's method with Line Search and Barriers
  do 
    g = K * alpha - I - (mu ./ alpha) + (mu ./ (C - alpha));
    H = K + diag(mu ./ alpha.^2) + diag(mu ./ (C - alpha).^2);
    d = -H \ g;
    i = i + 1;
    t = 1;
    while (f(K, C, alpha + t * d, mu) > (f(K, C, alpha, mu) + 0.5 * t * g' * d))
      t = t * beta;
    endwhile
    if (t > 0.99 && mu > epsilon) 
      mu = mu * b;
    endif
    alpha = alpha + t * d;
  until ((norm(d) <= epsilon && mu <= epsilon) || i >= Nmax)
end
% Calculate the value of f
function f_alpha = f(K, C, alpha, mu)
  I = ones(size(alpha));
  if (any(alpha > C) || any (alpha < 0))
    f_alpha = inf;
  else 
    f_alpha = alpha' * K * alpha ./2 - I' * alpha - mu * I' * log(alpha) - mu * I' * log(C - alpha);
  end
end

