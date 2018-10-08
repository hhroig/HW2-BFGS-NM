function [x, it, it_line_search, nfe, time] = mod_newton(fun_obj,x0)
% Modified Newton Method with a line search: 
% H_k is replaced by B_k = H_k + lambda*I, where lambda is chosen in an 
% iterative way, starting from lambda = 1 and increasing its value in 1
% until B_k is d.p
tic

% Linesearch-Parameters:
beta = 0.5; 
sigma = 10^(-4);
eta = 0.9;
% Tolerance:
iter_max = 1000;
conv_limit = 1.0e-8;

% Start countign iterations:
it = 0; 
it_line_search = 0;

% Initial evaluation:
x = x0;
[f,g, H] = fun_obj(x);
nfe = 1;

% Initializing B:
B = H;


while (norm(g) > conv_limit) && (it < iter_max)
    lambda = 100;
while min(eig(B)) <= eps
    B = B + lambda*eye(size(B));
    lambda = lambda^2;
end
p = -inv(B)*g;

alpha = 1;
[ff,gg,HH] = fun_obj(x+alpha*p);
nfe =  nfe +1;

if ff > f + sigma*alpha*p'*g
while (ff > f + sigma*alpha*p'*g) || (abs(p'*gg) > eta*abs(p'*g))
    alpha = alpha*beta;
    [ff,gg,HH] = fun_obj(x+alpha*p);
    nfe = nfe + 1;
    it_line_search = it_line_search + 1;
end
end

%obtain s_k:
s = alpha*p;
% update: x_k+1 = x_k + s_k:
x = x + s;

% we update B_k+1 (the Hessian evaluated in the new point):
B = HH;

% finally, we update the evaluations in f and its gradient:
f = ff; g = gg;
it = it + 1;
end
time = toc;
end

