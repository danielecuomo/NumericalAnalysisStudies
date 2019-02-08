clear; clc;
addpath('..');

a = 0; alpha = 0;
b = 1; beta = 1;
n = 100;
h = (b - a)/(n-1);

f = @(x) 0*x;
p = @(x) 2 + 0*x;
q = @(x) 1 + 0*x;

y = tpb(p, q, f, a, b, h, alpha, beta);

x = a:h:b;

fplot(@(x) x.*exp(1-x), [0, 1]);
hold on;
plot(x, y);
hold off;

err = norm(y - x.*exp(1-x));