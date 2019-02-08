function [x,ierr] = mybisection(f,a,b,tol,Kmax)
%MYBISECTION Finds function zeros.
%   X = MYBISECTION(F,A,B,TOL,KMAX) tries to find a root of the continuous
%   function F in the interval [A,B] using the bisection method. If the
%   search fails IERR is setted to -1.
%   Assume that the instance is well formed w.r.t. the method.

    x = 0; 
    ierr = 0;
    
    fa = f(a); fb = f(b);
    Kmin = floor(log((b-a)/tol)) - 1;
    
    if Kmin > Kmax
        ierr = -1;
    else
        Kmax = Kmin;
    end
    
    for k = 1:Kmax
        x = (a + b)*0.5; fx = f(x);
        
        if fa*fx < 0
            b = x; fb = fx;
        elseif fx*fb < 0
            a = x; fa = fx;
        else
            break;
        end
    end
end