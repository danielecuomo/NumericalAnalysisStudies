clear;
set(0,'defaulttextInterpreter','latex');
f = figure('Name','Interpolazione di Runge', 'Color','white', 'NumberTitle','off');
f.ToolBar = 'none';

runge = @(x) 1 ./ (1 + 25*(x.^2));
num_nodes = [4, 8, 16];
for n = num_nodes
    x = linspace(-1, +1, n+1)';
    y = runge(x);
    
    d = divdiff(x, y);
    fplot(@(v) divval(v, x, d), [min(x),max(x)], '-o');
    hold on
end

legend({'4 nodi', '8 nodi', '16 nodi'}, 'Location','southeast');
xlabel('x');
ylabel('$\frac{1}{1+25x^2}$');
hold off;

errornewton(runge, x, d);