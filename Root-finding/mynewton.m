function [x,ierr] = mynewton(f,fp,x0,tol,Kmax)
%MYNEWTON Finds function zeros.
%   X = MYNEWTON(F,FP,X0,TOL,KMAX) tries to find a root of the continuous
%   and differentiable function F nearest XO using the Newton method. If
%   the search fails IERR is setted to -1.

    k = 0;  x = x0 - (f(x0)/fp(x0)); 
    ierr = 0; delta = tol + 1;
    
    while k < Kmax && abs(delta) > tol       
        k = k + 1;
        
        x0 = x;
        delta = - (f(x0)/fp(x0));
        x = x0 + delta;
    end
    
    if abs(delta) > tol
        ierr = -1;
    end
end