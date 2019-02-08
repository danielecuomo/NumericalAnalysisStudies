function [x,ierr] = myj(AA,AC,AI,b,x0,Kmax,tol)
    %l'algoritmo suppone una matrice A con diag(A) senza elementi nulli
    
    n = length(AI)-1; k = 1; x = zeros(size(x0));
    ierr = 0;
    
    while true
        for i = 1:n
            j1 = AI(i); j2 = AI(i+1)-1;
            sumi = AA(j1:j2) * x0(AC(j1:j2));
       
            d = find(AC(j1:j2) == i, 1) + j1 - 1;
            x(i) = (b(i) - sumi)/AA(d) + x0(i);
        end
        
        if k > Kmax || norm(x - x0, inf) < tol
            break;
        end
        x0 = x; k = k+1;
    end
    
    if norm(x - x0, inf) >= tol
        ierr = -1;
    end
end