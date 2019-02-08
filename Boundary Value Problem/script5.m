clear; clc;
addpath('..');

a = 100; beta = 200; 
b = a/2; alpha = 0;

n = 5; h = (a - b)/(n-1);

f = @(r) 0*r;
p = @(r) 1./r;
q = @(r) 0*r;

T = tpb(p, q, f, b, a, h, alpha, beta);
r = b:h:a;

fplot(@(r) beta*(1 - log(r/a)/log(0.5)), [b,a]);
hold on;

plot(r, T);

err = norm(T - beta*(1 - log(r/a)/log(0.5)));