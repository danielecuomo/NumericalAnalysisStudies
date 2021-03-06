function gserrorplot(AA,AC,AI,b,x0,Kmax,tol)    
    n = length(AI)-1; k = 1; x = zeros(size(x0));
    iters = zeros(1,Kmax);
    
    while true
        for i = 1:n
            j1 = AI(i); j2 = AI(i+1)-1;
            d = find(AC(j1:j2) == i, 1) + j1 - 1;
            
            sumi = AA(j1:d-1)*x(AC(j1:d-1)) + AA(d+1:j2)*x0(AC(d+1:j2));    
            x(i) = (b(i) - sumi)/AA(d);
        end
        
        iters(k) = norm(x - x0, inf);
        if k > Kmax || norm(x - x0, inf) < tol
            break;
        end
        
        x0 = x; k = k+1;
    end
    
    plot(iters(1:k), 'x');
end
