function errplot(AA, AC, AI, b, x0, Kmax, tol)
    figure('Name','Sparse Matrices', 'Color','white', 'NumberTitle','off');
    
    jerrorplot(AA,AC,AI,b,x0,Kmax,tol);
    hold on;
    gserrorplot(AA,AC,AI,b,x0,Kmax,tol);
    legend({'Jacobi', 'Gauss-Seidel'}, 'Location','northeast');
    ylabel('${||x^{(k)} - x^{(k-1)}||}_{\infty}$');
    xlabel('$k$');
    hold off;
end