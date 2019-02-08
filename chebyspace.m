function [ x ] = chebyspace(a, b, n)
    c1 = (a+b)*(1/2);
    c2 = (b-a)*(1/2);

    k = 1:n;
    x = c1 + c2*cos( (2.*k - 1)/(2*n) * pi);
    
    x = x(n:-1:1);
end

