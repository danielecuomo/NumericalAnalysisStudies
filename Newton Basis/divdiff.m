function [ d ] = divdiff(xdata, ydata)
    n = size(xdata, 1);
    D = zeros(n, n);
    
    for i = 1:n
        D(i,1) = ydata(i);
    end

    for j = 2:n
        for i= j:n
            D(i,j) = (D(i,j-1) - D(i-1,j-1))/(xdata(i)-xdata(i-j+1));   
        end
    end
    d = diag(D);
end

