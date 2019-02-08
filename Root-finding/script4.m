clear; clc;

f = @(x) x - 2*sin(x);
df = @(x) 1 - 2*cos(x);

x0 = [1.1, 1.5];
tol = 1.E-5; k = 100;

[x1, ierr1] = mynewton(f, df, x0(1), tol, k);
[x2, ierr2] = mynewton(f, df, x0(2), tol, k);

r1 = f(x1); r2 = f(x2);

%Questo esempio rende chiara l'importanza della scelta del punto iniziale
%per l'efficacia del metodo. Si è infatti ottenuta una convergenza soltanto
%a partire da 1.5, mentre con 1.1 il metodo ha sforato il numero di
%iterazioni permesse con pessimi risultati. Andando ad osservare le
%derivate nei punti scelti si può notare come df(1.1) sia sufficientemente
%vicina a 0 da portare l'algoritmo a divergere.
dx0 = [df(x0(1)), df(x0(2))];

figure('Name','x - 2*sin(x)', 'Color','white', 'NumberTitle','off');
fplot(@(x) f(x), [-10, 10]);
hold on;
fplot(@(x) f(x0(1)) + df(x0(1))*(x - x0(1)), [-10 10], 'g');
hold on;
fplot(@(x) f(x0(2)) + df(x0(2))*(x - x0(2)), [-10 10], 'g');

clear df f tol x0 k fig;