function [ c ] = naturalsys( h, y )
    n = length(y);
    
    b = zeros(n, 1);
    for i = 2:n-1
        b(i) = (3/h(i))*(y(i+1) - y(i)) - (3/h(i-1))*(y(i) - y(i-1));
    end
    
    d1 = zeros(1, n-2);
    for i = 2:length(h)
        d1(i-1) = 2*(h(i-1) + h(i));
    end
    d1 = horzcat(1, d1, 1);
    d2 = horzcat(0, h, 0);
    
    c = thomas(d1, d2(2:n+1), d2(1:n), b);
end

