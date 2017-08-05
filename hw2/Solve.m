A = [1.1348 3.8326 1.1651 3.4017; 0.5301 1.7875 2.5330 1.5435; 3.4129 4.9317 8.7643 1.3142; 1.2371 4.9998 10.6721 0.0147];
b = [9.5342; 6.3941; 18.4231; 16.9237];
disp('Gaussian elimination')
X = GaussianElimination( A, b )
disp('Column principal component elimination')
X = ColumnElimination( A, b )