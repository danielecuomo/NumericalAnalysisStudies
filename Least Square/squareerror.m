function [ e ] = squareerror( ydata, pval )
    e = sum((ydata - pval).^2);
end

