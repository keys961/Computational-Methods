function [ X,k ] = Jacobi( A, b, X0, eps )
%Jacobi Iteration
D = diag(diag(A));%Get diag(A)
L = -tril(A, -1);
U = -triu(A, 1);
B = D \ (L + U);%Get Bj
f = D \ b;%Get fj
X = B * X0 + f;%First Iteration
k = 1;
%Start iteration
while norm(X - X0) >= eps
    X0 = X;
    X = B * X0 + f;
    k = k + 1;
end
end

