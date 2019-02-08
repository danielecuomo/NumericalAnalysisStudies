function [x,ierr] = mynewtonsys(Ffun,Jfun,x0,tol,Kmax)
%MYNEWTONSYS Finds a zero of a nonlinear system.
%   X = MYNEWTONSYS(FFUN,JFUN,X0,TOL,KMAX) tries to find the vector X, zero
%   of a nonlinear system defined in FFUN with jacobian matrix defined in
%   the function JFUN, nearest to the vector XO. If the search fails IERR
%   is setted to -1.

    delta = - Jfun(x0)\Ffun(x0);
    x = x0 + delta;
    k = 0; ierr = 0;
    
     while k < Kmax && norm(delta) > tol      
        k = k + 1; 
        
        delta = - Jfun(x)\Ffun(x);
        x = x + delta;
     end
     
     if norm(delta) > tol
         ierr = -1;
     end
end