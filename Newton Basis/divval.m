function [ pval ] = divval(xval,xdata, d)    
    pval = 0;
    for i = length(d):-1:2
        pval = (pval + d(i))*(xval - xdata(i-1)); %Horner
    end
    pval = pval + d(1);
end

