clear;
set(0,'defaulttextInterpreter','latex');
f = figure('Name','Interpolazione di Newton', 'Color','white', 'NumberTitle','off');
f.ToolBar = 'none';

num_nodes = [4, 8, 16, 32];
for n = num_nodes
    x = linspace(-1, +1, n+1)';
    y = exp(x);
    
    d = divdiff(x, y);
    fplot(@(v) divval(v, x, d), [min(x),max(x)], '-o');
    hold on
end

legend({'4 nodi', '8 nodi', '16 nodi', '32 nodi'}, 'Location','southeast');
xlabel('x');
ylabel('$e^x$');
hold off

errornewton(@exp, x, d);