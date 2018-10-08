function [f,g,H] = f1(x)
% f_1(x) & = & x_1^2 + 5x_2^2 + x_1 -5 x_2
% x = (x_1, x_2) in R^2 
f = x(1)^2 + 5*x(2)^2 + x(1) - 5*x(2);
g = [2*x(1)+1; 10*x(2)-5];
H = [2 0;0 10];
%real_sol = fminsearch(@f1,[10,10]);
end
