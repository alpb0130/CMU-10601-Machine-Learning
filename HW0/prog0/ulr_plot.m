
% 10601A/SV-F15: Introduction to Machine Learning
% Programming Assignment 0: Octave and Autolab
%
% TASK 2: Write a function that finds the most likely values
%         of w1 and w2 using the least squares approach. 
% ============================================================ 
% INPUT   x: a column vector that contains xi, for i = 1, 2, ..., n; 
%         y: a column vector that contains yi, for i = 1, 2, ..., n; 
%         w1, w2: the two scalars obtained by invoking ulr with x and y. 
% ============================================================ 
% OUTPUT  h: a handle to a figure that contains the data points and the fitted line. 

function [h] = ulr_plot(x, y, w1, w2) 
% ULR_PLOT    Plots the data points and the fitted line using scatter and line
  yy = w1 * x + w2;
  scatter(x, y);
  hold on;
  line(x, yy);
  hold off;
  h = figure(gcf); 
endfunction 
