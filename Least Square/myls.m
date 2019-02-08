function [ coeff ] = myls(xdata, ydata, m)
    n = length(xdata);
    
    A = ones(n, m+1);
    for j=2:(m+1)
        A(:,j) = xdata(:).^(j-1);
    end
    
    coeff = flipud(A\ydata);
end

