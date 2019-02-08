clear; clc;
addpath('..');

a = 0; alpha = 1;
b = 1; beta = 0;

n = 10; h = (b - a)/(n-1);

f = @(x) 0*x;
p = @(x) -exp(-x);
q = @(x) 0*x;

y = tpb(p, q, f, a, b, h, alpha, beta);

plot(a:h:b, y);