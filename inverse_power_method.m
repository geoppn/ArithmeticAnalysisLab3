function [lambda,znew] = inverse_power_method(A,y,q,tol,maxiter)
    lambda0=0;
    B = A - q*eye(size(A)); % SHIFT THE MATRIX ACCORDINGLY
    p=min(find(abs(y)==max(abs(y)))); 
    z=y/y(p); % EIGENVECTOR
    znew=z;
    for i=1:maxiter
        znew=B\y; % SOLVE THE SYSTEM
        p=min(find(abs(znew)==max(abs(znew)))); % MAX VALUE
        y=znew/znew(p); 
        lambda = (y'*A*y)/(y'*y); % USE RAYLEIGH (FROM LAB SLIDES) TO CALCULATE EIGENVALUE
        if abs(lambda0-lambda)<tol % CONVERGENCE?
            disp(['Converged after ', num2str(i), ' iterations.']);
            return;
        end;
        lambda0=lambda;
    end;
    if abs(lambda0-lambda)>=tol
        s=sprintf(' Όχι σύγκλιση μετά από %d, επαναλήψεις', maxiter);
        disp(s);
    end; 
end