clear;
addpath(genpath('../..'));

set(0,'defaulttextInterpreter','latex');
f = figure('Name','Interpolazione funzione di Runge', 'Color','white', 'NumberTitle','off');
f.ToolBar = 'none';
num_nodes = [4, 8, 16, 32];

runge = @(x) 1 ./ (1 + 25*(x.^2));
zval = linspace(-1, +1, 100);
for n=num_nodes
    xdata = chebyspace(-1, +1, n);
    ydata = runge(xdata);
    
    plot(zval, cubicspline(xdata, ydata, zval));
    hold on;
end

fplot(@(x) runge(x), [-1,+1]);

legend({'4 nodi', '8 nodi', '16 nodi', '32 nodi', '\infty'}, 'Location','southeast');
xlabel('x');
ylabel('$\frac{1}{1+25x^2}$');
ax = gca;
ax.YLabel.FontSize = 16;
ax.XLabel.FontSize = 16;
hold off;