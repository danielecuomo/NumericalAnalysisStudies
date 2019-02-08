function [ spval ] = cubicspline( xdata, ydata, zval )
    n = size(xdata, 2);
    h = zeros(1, n-1);
    
    for j=1:n-1
        h(j) = xdata(j+1) - xdata(j);
    end
    
    c = naturalsys(h, ydata);
    
    a = ydata(1:n-1);
    b = zeros(1, n-1);
    d = zeros(1, n-1);
    for j=1:n-1
        b(j) = ((ydata(j+1)-ydata(j))/h(j)) - ((h(j)/3)*(c(j+1) + (2*c(j))));
        d(j) = (c(j+1) - c(j)) / (3*h(j));
    end
 
    %dichiarazione calcolo del polinomio
    s = @(j, x) a(j) + b(j)*(x-xdata(j)) + c(j)*((x-xdata(j)).^2) + d(j)*((x-xdata(j)).^3);
    
    %valutazione in zval
    spval = zeros(1, size(zval, 2));
    for i=1:size(zval, 2)
        %cerco l'intervallo di appartenenza di z
        for j=2:n
            if zval(i) <= xdata(j)      %ottimizzabile sfruttando l'ordinamento di zval
                break;
            end
        end
        spval(i) = s(j-1, zval(i));
    end
end

