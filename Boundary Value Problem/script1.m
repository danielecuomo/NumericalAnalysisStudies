clear; clc;
addpath('..');

a = 1; alpha = 0;
b = 2; beta = 0.638961;
n = 10;
h = (b - a)/(n-1);

f = @(x) 0*x;
p = @(x) 1./x;
q = @(x) 1./(x.^2);

y = tpb(p, q, f, a, b, h, alpha, beta);

x = a:h:b;

fplot(@(x) sin(log(x)), [1, 2]);
hold on;
plot(x, y);

err = norm(y - sin(log(x)));