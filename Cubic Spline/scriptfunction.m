clear;
addpath(genpath('../..'));

set(0,'defaulttextInterpreter','latex');
fig = figure('Name','Interpolazione f(x)', 'Color','white', 'NumberTitle','off');
fig.ToolBar = 'none';

f = @(x) x.*exp(-(x-1).^2);
zval = linspace(0, 5, 100);
xdata = chebyspace(0, 5, 10);
ydata = f(xdata);
spval = cubicspline(xdata, ydata, zval);

ax = subplot(2,1,1);
plot(zval, spval);
hold on;

fplot(@(x) f(x), [0,5]);

legend({'10 nodi', '\infty'}, 'Location','southeast');
xlabel(ax, 'x');
ylabel(ax, '$f(x) = xe^{-(x-1)^2}$');
hold off;

ax = subplot(2,1,2);
plot(f(zval) - spval);
xlabel(ax, 'x');
ylabel(ax, '$f(x) - s_n(x)$');