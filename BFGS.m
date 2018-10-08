function [x, it, it_line_search, nfe, time] = BFGS(fun_obj,x0)
% Quasi-Newton Method with BFSG update and a linesearch
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
% - option 1:
%B = eye(size(H)); 
% - option 2:
B = H;
lambda = 100;
while min(eig(B)) <= eps
    B = B + lambda*eye(size(B));
    lambda = lambda^2;
end

invB = inv(B);

while (norm(g) > conv_limit) && (it < iter_max)
p = -invB*g;

alpha = 1;
[ff,gg,~] = fun_obj(x+alpha*p);
nfe =  nfe +1;

if ff > f + sigma*alpha*p'*g
while (ff > f + sigma*alpha*p'*g) || (abs(p'*gg) > eta*abs(p'*g))
    alpha = alpha*beta;
    [ff,gg,~] = fun_obj(x+alpha*p);
    nfe = nfe + 1;
    it_line_search = it_line_search + 1;
end
end

%obtain s_k:
s = alpha*p;

% update: x_k+1 = x_k + s_k:
x = x + s;

% obtain y_k = grad_f(x_k+1) - grad_f(x_k):
y = gg-g;

% we update (directly) the inverse of B_k+1:
invB = ( eye(size(invB)) - (s*y')/(y'*s) )*invB*( eye(size(invB)) - (y*s')/(y'*s) ) + (s*s')/(y'*s); 

% finally, we update the evaluations in f and its gradient:
f = ff; g = gg;
it = it + 1;
end
time = toc;
end

