clear;
f = @(x) 1./(x.^2 + 1/(2.^16));
a = -1; b = +1;

%tol = 0.1; nfmax = 2049;
tol = 0.005; nfmax = 4096;
%La formula richiede molte chiamate alla funzione, nonostante il 
%miglioramento sia notevole ad ogni iterazione.
%Da notare come con 2048 chiamate non si riesce a soddisfare neanche una
%tolleranza di 0.1.

[S, ierr] = myquad(a, b, tol, f, nfmax);
I = integral(f, a, b);

e = abs(I - S);