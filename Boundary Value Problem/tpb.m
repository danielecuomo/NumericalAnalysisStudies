function y = tpb(p, q, f, a, b, h, alpha, beta)
    x = (a:h:b); %h = (b - a)/(n-1)
    x = x(2:end-1);
    
    h2 = h.^2;
    
    a = (-2 + h2.*q(x));
    b = (1 - (h/2).*p(x));
    c = (1 + (h/2).*p(x));
    
    z = h2.*f(x);
    z(1) = z(1) - alpha*b(1);
    z(end) = z(end) - beta*c(end);
    
    y = [alpha; thomas(a, b, c, z); beta];
end