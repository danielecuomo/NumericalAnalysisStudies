function [S, ierr] = myquadadapt(a, b, tol, fun, hmin)    
    ierr = 0;
    h = b-a;
    sum = fun(a) + fun(b);
    
    Sold = (h/2)*sum;
    h = h/2;
    S = (h/2)*(sum + 2*fun(a+h));

    if h > hmin && 3*tol < abs(S - Sold)
        m = (a + b)/2;
        [L, ierrL] = myquadadapt(a, m, tol/2, fun, hmin);
        [R, ierrR] = myquadadapt(m, b, tol/2, fun, hmin);
        S = L + R;
        ierr = ierrL + ierrR;
    end
    
    if h < hmin || ierr < 0
        ierr = -1;
    end
end
