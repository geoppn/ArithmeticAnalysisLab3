function [lambda,znew] = inverse_power_method(A,y,q,tol,maxiter)
    lambda0=0;
    B = A - q*eye(size(A)); % Shift the matrix A
    p=min(find (abs(y)==max(abs(y)))); % Find the position of the maximum absolute value of y
    z=y/y(p); % The eigenvector
    znew=z;
    for i=1:maxiter
        znew=B\y; % Solve the system (A - qI)z = y for z
        p=min(find (abs(znew)==max(abs(znew)))); % Find the position of the maximum absolute value of znew
        y=znew/znew(p); % Update y
        lambda = (y'*A*y)/(y'*y); % Calculate the eigenvalue using the Rayleigh quotient
        if abs(lambda0-lambda)<tol % Check for convergence
            return;
        end;
        lambda0=lambda;
    end;
    if abs(lambda0-lambda)>=tol
        s=sprintf(' Όχι σύγκλιση μετά από %d, επαναλήψεις', maxiter);
        disp(s);
    end; 
end