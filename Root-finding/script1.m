clear; clc;

tol = 1.E-5;
k = inf;
x0 = [-0.5 -0.5 0 0.5 1]; x1 = [0 0.5 1 1.5 2]; 
n = length(x0);

errNa = zeros(1,n); errSa = zeros(1,n); %errori sulla funzione a
errNb = zeros(1,n); errSb = zeros(1,n); %errori sulla funzione b

%Usare il metodo di Newton e quello delle secanti per risolvere i seguenti
%problemi con una tolleranza di 10^-5 sull'errore assoluto:

%a.
a = @(x) 3*x*exp(x);
da = @(x) 3*exp(x)*(x+1);

%Osservando la funzione si osserva che la radice è unica in 0
alpha = 0;

%Allo scopo di stimare quale metodo è più adatto per la funzione data, si
%effettuano vari casi di test con intervalli diversi. Si fa infine una
%norma degli errori raccolti.

for i = 1:n
    xN = mynewton(a, da, x0(i), tol, k);
    xS = mysecant(a, x0(i), x1(i), tol, k);
    
    errNa(i) = abs(xN - alpha);
    errSa(i) = abs(xS - alpha);
end

fprintf("a. Si è ottenuta una precisione maggiore con il ");
if norm(errNa) > norm(errSa)
    fprintf("metodo delle secanti\n");
else
    fprintf("metodo di Newton\n");
end

%b.
b = @(x) 2*x + 3*cos(x) - exp(x);
db = @(x) -exp(x) - 3*sin(x) + 2;

for i = 1:n
    xN = mynewton(b, db, x0(i), tol, k);
    xS = mysecant(b, x0(i), x1(i), tol, k);
    %Essendo non banale la radice della funzione B, si usa il residuo come
    %criterio di confronto
    errNb(i) = b(xN);
    errSb(i) = b(xS);
end

fprintf("b. Si è ottenuta una precisione maggiore con il ");
if norm(errNb) > norm(errSb)
    fprintf("metodo delle secanti\n");
else
    fprintf("metodo di Newton\n");
end

clear a alpha b da db i k n tol x0 x1 xN xS