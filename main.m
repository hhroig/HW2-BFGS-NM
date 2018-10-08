%% True Solutions
% using MATLAB's built in function: fminsearch

sols_by_matlab

% "True" solutions:
sol1
sol2
sol3
sol4

%% Performance of BFGS
% Let's fixed an initial value that is not too close to any of the true
% solutions:
x0 = [10; 5];

[x1, it1, it_line_search1, nfe1, time1] = BFGS(@f1,x0);
[x2, it2, it_line_search2, nfe2, time2] = BFGS(@f2,x0);
[x3, it3, it_line_search3, nfe3, time3] = BFGS(@f3,x0);
[x4, it4, it_line_search4, nfe4, time4] = BFGS(@f4,x0);


%% Performance of NM
% Let's fixed an initial value that is not too close to any of the true
% solutions:
x0 = [10; 5];

[x1, it1, it_line_search1, nfe1, time1] = mod_newton(@f1,x0);
[x2, it2, it_line_search2, nfe2, time2] = mod_newton(@f2,x0);
[x3, it3, it_line_search3, nfe3, time3] = mod_newton(@f3,x0);
[x4, it4, it_line_search4, nfe4, time4] = mod_newton(@f4,x0);

