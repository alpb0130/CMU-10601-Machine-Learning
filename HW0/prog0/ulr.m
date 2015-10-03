
% 10601A/SV-F15: Introduction to Machine Learning
% Programming Assignment 0: Octave and Autolab
%
% TASK 1: Write a function that finds the most likely values
%         of w1 and w2 using the least squares approach. 
% ============================================================ 
% INPUT   x: a column vector that contains n observations of x; 
%         y: a column vector that contains the n corresponding observations of y.
% ============================================================ 
% OUTPUT  w1, w2: scalars that correspond to w1 and w2 respectively. 

function [w1, w2] = ulr(x, y) 
% ULR    Find the most likely values of w1, w2 using the least squares approach
 [w1, w2] = deal(0);
 avgx = sum(x)/length(x);
 avgy = sum(y)/length(y);
 w1 = sum((x - avgx) .* (y - avgy)) / sum(power((x - avgx), 2));
 w2 = avgy - avgx * w1;
endfunction 

