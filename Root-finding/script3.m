clear; clc;

f = @(x) exp(x) - x - 1;
df = @(x) exp(x) - 1;

x0 = 1; tol = 1.E-5; k = 50;

x = mynewtonsys(f, df, x0, tol, k);
r = f(x);

%L'algoritmo risulta convergente ad alpha. Ciò nonostante, andando ad
%osservare le iterazioni, si può notare una degradazione delle prestazioni.
%Di fatto la funzione scelta ha radice multipla (df(alpha) = 0). Ne
%consegue che il grado di convergenza del metodo diventa lineare anzichè
%quadratico.

fig = figure('Name','exp(x) - x - 1', 'Color','white', 'NumberTitle','off');
fig.ToolBar = 'none';
fplot(@(x) f(x), [-20, 5]);

clear tol x0 k fig;