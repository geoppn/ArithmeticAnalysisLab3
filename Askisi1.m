A=[16 -8 2 1; 2 -12 1 0; -1 1 -4 1; 0 -1 2 3];
disp('A'); disp(A);
n=4;nn=4;
[n, nn]=size(A);
y=[1 1 1 1]'; % ADJUST INITIAL VECTOR
disp('y'); disp(y);
nz=1;n1=4;
[n1, nz]=size(y);
maxiter=100;
tol=0.5e-6; % TOLERANCE
if (n~=nn)
    disp('Λάθος της μεθόδου δυνάμεων: Ο πίνακας Α πρέπει να είναι τετραγωνικός');
    return;
elseif (n~=n1)
    disp('Λάθος της μεθόδου δυνάμεων: Οι διαστάσεις του πίνακα Α και του διανύσματος y δεν είναι συμβατές');
    return;
end

tic % TIME MEASURE

% GET EIGENVALUES USING MATLAB EIG
idiotimes=eig(A);
abs_idiotimes = abs(idiotimes);

lambda1 = max(abs_idiotimes);
lambda_max_values = zeros(size(lambda1-0.9:0.1:lambda1-0.3));
zmax_values = zeros(n, length(lambda1-0.9:0.1:lambda1-0.3)); % SET THE Q VALUES AS INSTRUCTED

index = 1; % LOOP FOR MAX EIGENVALUE
for q = lambda1-0.9:0.1:lambda1-0.3
    [lambda_max,zmax] = inverse_power_method(A,y,q,tol,maxiter);
    lambda_max_values(index) = lambda_max;
    zmax_values(:, index) = zmax;
    disp(['Shift q: ', num2str(q)]); % NECCESSARY PRINTS TO FILL TABLE
    disp(['Eigenvalue: ', num2str(lambda_max)]);
    disp('Eigenvector: '); disp(zmax);
    index = index + 1;
end

[lambda_max, max_index] = max(lambda_max_values);
zmax = zmax_values(:, max_index);

disp('The largest eigenvalue is:'), disp(lambda_max)
disp('The corresponding eigenvector is:'), disp(zmax)

% MIN EIGENVALUE SECTION
lambda4 = min(abs_idiotimes);
lambda_min_values = zeros(size(lambda4+0.3:0.1:lambda4+0.9));
zmin_values = zeros(n, length(lambda4+0.3:0.1:lambda4+0.9));

% LOOP FOR MIN EIGENVALUE
index = 1;
for q = lambda4+0.3:0.1:lambda4+0.9
    [lambda_min,zmin] = inverse_power_method(A,y,q,tol,maxiter);
    lambda_min_values(index) = lambda_min;
    zmin_values(:, index) = zmin;
    disp(['Shift q: ', num2str(q)]);
    disp(['Eigenvalue: ', num2str(lambda_min)]);
    disp('Eigenvector: '); disp(zmin);
    index = index + 1;
end

[lambda_min, min_index] = min(lambda_min_values);
zmin = zmin_values(:, min_index);

disp('The smallest eigenvalue is:'), disp(lambda_min)
disp('The corresponding eigenvector is:'), disp(zmin)

[V,D] = eig(A);

% DISPLAY OUR RESULTS AND MATLABS TO COMPARE
disp('Comparison of the largest eigenvalue:')
disp('MATLAB:'), disp(max(abs(diag(D))))
disp('Our implementation:'), disp(abs(lambda_max))

disp('Comparison of the smallest eigenvalue:')
disp('MATLAB:'), disp(min(abs(diag(D))))
disp('Our implementation:'), disp(abs(lambda_min))

toc % TIME END