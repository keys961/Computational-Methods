A = [4 -1 0 -1 0 0;
    -1 4 -1 0 -1 0;
    0 -1 4 -1 0 -1;
    -1 0 -1 4 -1 0;
    0 -1 0 -1 4 -1;
    0 0 -1 0 -1 4];
b = [0; 5; -2; 5; -2; 6];
X0 = [0; 0; 0; 0; 0; 0];
disp('Jacobi Iteration:')
[X, k] = Jacobi(A, b, X0, 0.0001)
disp('GSeid Iteration:')
[X, k] = Gseid(A, b, X0, 0.0001)
disp('SOR Iteration with 1.334:')
[X, k] = SOR(A, b, 1.334, X0, 0.0001)
disp('SOR Iteration with 1.95:')
[X, k] = SOR(A, b, 1.95, X0, 0.0001)
disp('SOR Iteration with 0.95:')
[X, k] = SOR(A, b, 0.95, X0, 0.0001)