clear;
f = @(x) (100./(x.^7)).*sin(10./(x.^7));
a = 1; b = 3;

%tol = 0.5; nfmax = 256;
%tol = 0.05; nfmax = 512;
tol = 0.005; nfmax = 2048;

hmin = 1E-5;

[S1, ierr1] = myquad(a, b, tol, f, nfmax);
[S2, ierr2] = myquadadapt(a, b, tol, f, hmin);

I = integral(f, a, b);
nonadpterr = abs(I - S1);
adpterr = abs(I - S2);
