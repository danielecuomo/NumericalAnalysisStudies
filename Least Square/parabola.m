clear;
clear;
addpath(genpath('../..'));

set(0,'defaulttextInterpreter','latex');
fig = figure('Name','Regressione Parabolica', 'Color','white', 'NumberTitle','off');
fig.ToolBar = 'none';
n = 8;
x = chebyspace(-4, +4, n)';

parab = @(x) (x.^2)/4;
y = parab(x);

m = 2;

coeff = myls(x, y, m);

fplot(@(xval) polyval(coeff, xval), [-4, +4]);
hold on
fplot(@(xval) parab(xval), [-4, +4]);
hold on
plot(x, y, '*');