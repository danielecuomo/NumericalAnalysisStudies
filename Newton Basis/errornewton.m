function errornewton( f, x, d )
    fig = figure('Name','Errore con Newton', 'Color','white', 'NumberTitle','off');
    fig.ToolBar = 'none';

    ax = subplot(2,1,1);
    fplot(@(v) (f(v) - divval(v, x, d)), [-1, +1]); %stampa dell'errore
    xlabel(ax, 'x');
    ylabel(ax, '$f(x) - p_n(x)$');
    hold on;
    ax = subplot(2,1,2);
    fplot(@(v) prod(v - x), [-1, +1]);  %condizionamento di omega
    xlabel(ax, 'x');
    ylabel(ax, '$\omega_n(x)$');
    
end

