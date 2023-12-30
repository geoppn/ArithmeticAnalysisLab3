function [lambda,znew] = inverse_power_method(A,y,q,tol,maxiter)
    lambda0=0;
    p=min(find (abs(y)==max(abs(y))));
    pp=norm(y, Inf);
    z=y/y(p);
    znew=z;
    for i=1:maxiter
        ynew=(A - q*eye(size(A))) \ znew; % note the use of backslash operator for solving linear system
        pp=norm(ynew, Inf);
        lambda=ynew(p);
        p=min(find (abs(ynew)==max(abs(ynew))));
        znew=ynew/ynew(p);
        if abs(lambda0-lambda)<tol
            return;
        end;
        lambda0=lambda;
    end;
    if abs(lambda0-lambda)>=tol
        s=sprintf(' Όχι σύγκλιση μετά από %d, επαναλήψεις', maxiter);
        disp(s);
    end; 
end