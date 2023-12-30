function [lambda,znew] = eig_power(A,y,tol,maxiter)
    % Συνάρτηση για την προσέγγιση της μεγαλύτερης κατά μέτρο ιδιοτιμής
    % και του αντίστοιχου ιδιοδιανύσματος ενός πίνακα Α.
    lambda0=0;
    % Εύρεση ακέραιου p τέτοιου ώστε |yp|=max||yi||, i=1,...,n
    p=min(find (abs(y)==max(abs(y)))); % Βρίσκει τη θέση ji
    pp=norm(y, Inf);% Βρίσκει τη norm του άπειρον.
    z=y/y(p); % Το ιδιοδιάνυσμα
    znew=z;
    for i=1:maxiter
        % disp('Επανάληψη:'); disp(i);
        ynew=A*znew; %Βήμα 5.1
        pp=norm(ynew, Inf); % Εύρεση norm του άπειρον
        lambda=ynew(p); % Βήμα 5.2
        p=min(find (abs(ynew)==max(abs(ynew)))); % Βήμα 5.4
        znew=ynew/ynew(p); %Βήμα 5.5
        if abs(lambda0-lambda)<tol % Βήμα 5.6
            %disp('lambda');disp(lambda);
            %disp('z(znew)');disp(znew);
            return;
        end;
        lambda0=lambda;
        %disp('lambda0'); disp(lambda0);
    end;%for
    if abs(lambda0-lambda)>=tol
        s=sprintf(' Όχι σύγκλιση μετά από %d, επαναλήψεις', maxiter);
        disp(s);
    end; 
end