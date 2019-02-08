function [S, ierr] = myquad(a, b, tol, fun, nfmax)
    %l'algoritmo parte dall'ipotesi che fun'' sia quasi costante
    nfmax = nfmax - 3;
    h = b-a;
    n = 2;
    f_a = fun(a);
    f_b = fun(b);
    ierr = 0;
    
    Iold = (h/2)*(f_a + f_b);
    h = h/2;
    sum = fun(a + h);
    Inew = (h/2)*(f_a + 2*sum + f_b);
    
    while abs(Inew - Iold) > 3*tol
        h = h/2; n = 2*n;
        nfmax = nfmax - n/2;
        if nfmax < 0
            ierr = -1; break;
        end
        
        for i=1:n/2 %ho raddoppiato il numero di nodi, ma la metà li ho già calcolati
            sum = sum + fun(a + (2*i - 1)*h);
        end
        Iold = Inew;
        Inew = (h/2)*(f_a + 2*sum + f_b);
    end
    
    S = Inew;
end
