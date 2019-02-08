clear; clc;

f = @(x) tan(pi*x) - 6;
df = @(x) pi*sec(pi*x).^2;

alpha = (1/pi)*atan(6);
k = 15; tol = 1.E-8;

[b, ierrb] = mybisection(f, 0, 0.48, tol, k);
[s, ierrs] = mysecant(f, 0, 0.45, tol, k);
[n, ierrn] = mynewton(f, df, 0.45, tol, k);

berr = abs(b - alpha);
serr = abs(s - alpha);
nerr = abs(n - alpha);

%Il metodo della bisezione è partito da un intervallo I = (0,0.48)
%sufficientemente piccolo da poter convergere in una soluzione con un
%ordine di grandezza dell'errore pari a 10^-4.
%Non si può dire lo stesso per quanto riguarda il metodo delle secanti.
%L'allontanamento dalla soluzione è da imputarsi al comportamento della
%funzione. Evidentemente il metodo si concentra su di un intervallo dove la
%funzione cresce vertiginosamente.
%Similmente al metodo della bisezione anche per il metodo di Newton si è
%scelto un buon punto di partenza.
%Un altro dato che conferma i risultati teorici è la variabile ierr. Da
%essa si può infatti osservare come l'applicazione del metodo di Newton sia
%stata l'unica a soddisfare la tolleranza entro il limite di K = 10
%iterazioni. Tale fenomeno è da ricondursi ad un ordine di convergenza 
%maggiore rispetto a quello dei metodi di bisezione e delle secanti.
fig = figure('Name','tan(pi*x) - 6', 'Color','white', 'NumberTitle','off');
fig.ToolBar = 'none';
subplot(2,1,1); fplot(@(x) f(x), [-1,1]);
hold on;
subplot(2,1,2); fplot(@(x) f(x), [0,0.48]);

clear df fig k tol;