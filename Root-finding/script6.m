clear; clc;

N0 = sym(1E6);
v = sym(435E3);
M = sym(1564E3);

syms l t;
N = N0.*exp(l*t) + (v./l).*(exp(l*t) - 1);

N1 = subs(N,t,1) - M;

x0 = 1;
tol = 1E-7; k = 50;

x = mynewton(matlabFunction(N1), matlabFunction(diff(N1)), x0, tol, k);

figure('Name','N(t)', 'NumberTitle','off');
fplot(subs(N, l, x), [1 10]);

clear k tol fig l M N N0 N1 t v;