clear; clc;

addpath('..');
set(0,'defaulttextInterpreter','latex');
f = figure('Name','Ordine di convergenza del two point boundary values', 'Color','white', 'NumberTitle','off');
f.ToolBar = 'none';

a = 0; alpha = 0; 
b = 1; beta = 0;

T = 1; k = 0.1;

w = @(x) 1 + sin(4*pi*x);
f = @(x) w(x)/T;
p = @(x) 0*x;
q = @(x) k/T + 0*x;

u0 = tpb(p, q, f, a, b, 6.25e-7, alpha, beta);

i = [10 20 40 80, 160]; j = 1; e = zeros(1, length(i));
for h=1./i
    u = tpb(p, q, f, a, b, h, alpha, beta);
    
    tmp = u0(1:(length(u0) - 1)/(length(u)-1):end);
    e(j) = norm(u - u0(1:ceil(length(u0)/length(u)):end));
    j = j+1;
end
plot(1./i, e, '-*r');
xlabel('$h$');
ylabel('$errore$');