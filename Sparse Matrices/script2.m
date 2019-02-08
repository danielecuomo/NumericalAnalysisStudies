%E' immediato osservare come i risultati teorici si siano concretizzati
%inequivocabilmente. Come previsto infatti il metodo di Gauss-Seidel
%converge verso una stima dell'errore al di sotto della tolleranza in un
%numero di iterazioni che è inferiore alle iterazioni di cui
%necessita il meno efficiente metodo di Jacobi. Dal grafico mostrato si
%osserva che il metodo di Gauss-Seidel converge più rapidamente e soddisfa
%la tolleranza dopo 8 iterazione. Al contrario l'implementazione di Jacobi
%effettua n iterazione.

clear; clc;

AA = [6 -1 -5 10 -1 -1 20 14 -2 -3 8];
AC = [1 2 1 2 4 1 3 4 5 4 5];
AI = [1 3 6 8 10 12];

b = [2;4;1;3;5];
x0 = zeros(5, 1);

Kmax = 100; tol = 1E-6;

errplot(AA, AC, AI, b, x0, Kmax, tol);