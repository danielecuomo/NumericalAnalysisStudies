function [x,ierr] = mysecant(f, x0, x1, tol, Kmax)
%MYSECANT Finds function zeros.
%   X = MYSECANT(F,X0,X1,TOL,KMAX) tries to find a root of the continuous
%   function F nearest XO and X1 using the secant method. If
%   the search fails IERR is setted to -1.

    k = 0; ierr = 0;
    fx0 = f(x0); fx1 = f(x1);
    delta = x1 - x0;
    
    while abs(delta) > tol && k < Kmax
        k = k + 1;
        
        delta = - fx1*(x1-x0) / (fx1-fx0);
        
        x0 = x1; fx0 = fx1;
        x1 = x1 + delta; fx1 = f(x1);
    end
    x = x1;
    
    if tol < abs(delta)
        ierr = -1;
    end
end