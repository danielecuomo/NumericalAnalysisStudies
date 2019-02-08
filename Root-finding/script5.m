clear; clc;
%Script di testing di risoluzione per la ricerca della radice di un 
%sistema non lineare con metodo di Newton.

X0 = [1;1];
tol = 1E-5;
k = 10;

Ffun = @(x) [x(1)^2 + x(2)^2 - 1; sin(pi*x(1)/2) + x(2)^3];
Jfun = @(x) [2*x(1), 2*x(2); 0.5*pi*cos(0.5*pi*x(1)), 3*x(2)^2];

X = mynewtonsys(Ffun, Jfun, X0, tol, k);
R = sum(Ffun(X));

%La soluzione a seguire risulta inefficiente. Per quanto sia un approccio 
%generico, l'uso delle valutazioni di funzioni simboliche è troppo costoso.

%x = sym('x', [1 2]);
%Ffun(x) = [x(1)^2 + x(2)^2 - 1; sin(pi*x(1)/2) + x(2)^3];
%Jfun(x) = jacobian(Ffun, x);

clear k;