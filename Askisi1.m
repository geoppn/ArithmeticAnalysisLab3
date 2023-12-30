A=[16 -8 2 1; 2 -12 1 0; -1 1 -4 1; 0 -1 2 3];
disp('A'); disp(A);
n=4;nn=4;
[n, nn]=size(A);
y=[1 1 1 1]'; % Adjust the initial vector
disp('y'); disp(y);
nz=1;n1=4;
[n1, nz]=size(y);
maxiter=100;
tol=1e-6; % Set the desired accuracy
if (n~=nn)
    disp('Λάθος της μεθόδου δυνάμεων: Ο πίνακας Α πρέπει να είναι τετραγωνικός');
    return;
elseif (n~=n1)
    disp('Λάθος της μεθόδου δυνάμεων: Οι διαστάσεις του πίνακα Α και του διανύσματος y δεν είναι συμβατές');
    return;
end

tic % Start measuring time

% Find eigenvalues of A using eig
idiotimes=eig(A);

lambda1 = max(idiotimes);
lambda_max_values = zeros(size(lambda1-0.9:0.1:lambda1-0.3));
zmax_values = zeros(n, length(lambda1-0.9:0.1:lambda1-0.3));

index = 1;
for q = lambda1-0.9:0.1:lambda1-0.3
    [lambda_max,zmax] = inverse_power_method(A,y,q,tol,maxiter);
    lambda_max_values(index) = lambda_max;
    zmax_values(:, index) = zmax;
    index = index + 1;
end

[lambda_max, max_index] = max(lambda_max_values);
zmax = zmax_values(:, max_index);

disp('The largest eigenvalue is:'), disp(lambda_max)
disp('The corresponding eigenvector is:'), disp(zmax)

% Approximation of the smallest eigenvalue and its corresponding eigenvector
lambda4 = min(idiotimes);
lambda_min_values = zeros(size(lambda4+0.3:0.1:lambda4+0.9));
zmin_values = zeros(n, length(lambda4+0.3:0.1:lambda4+0.9));

index = 1;
for q = lambda4+0.3:0.1:lambda4+0.9
    [lambda_min,zmin] = inverse_power_method(A,y,q,tol,maxiter);
    lambda_min_values(index) = lambda_min;
    zmin_values(:, index) = zmin;
    index = index + 1;
end

[lambda_min, min_index] = min(lambda_min_values);
zmin = zmin_values(:, min_index);

disp('The smallest eigenvalue is:'), disp(lambda_min)
disp('The corresponding eigenvector is:'), disp(zmin)

[V,D] = eig(A);

% Display the eigenvalues and eigenvectors found by MATLAB
disp('Eigenvalues found by MATLAB:'), disp(diag(D))
disp('Eigenvectors found by MATLAB:'), disp(V)

% Compare the results
disp('Comparison of the largest eigenvalue:')
disp('MATLAB:'), disp(max(diag(D)))
disp('Our implementation:'), disp(lambda_max)

disp('Comparison of the smallest eigenvalue:')
disp('MATLAB:'), disp(min(diag(D)))
disp('Our implementation:'), disp(lambda_min)

toc % End measuring time