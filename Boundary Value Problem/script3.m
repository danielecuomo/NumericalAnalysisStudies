clear; clc;
addpath('..');

a = 1; alpha = 1.5;
b = 2; beta = 3;

n = 10; h = (b - a)/(n-1);

f = @(x) 0*x;
p = @(x) 0*x;
q = @(x) -x;

y = tpb(p, q, f, a, b, h, alpha, beta);

plot(a:h:b, y);