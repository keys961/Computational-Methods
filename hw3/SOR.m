function [ X,k ] = SOR( A, b, w, X0, eps )
%SOR Iteration
D = diag(diag(A));%Get diag(A)
L = -tril(A, -1);%Get -L
U = -triu(A, 1);%Get -U
B = (D - w * L) \ ((1 - w) * D + w * U);
f =  w * ((D - w * L) \ b);
X = B * X0 + f;%First iteration
k = 1;
%Start Iteration
while norm(X - X0) >= eps
    X0 = X;
    X = B * X0 + f;
    k = k + 1;
end
end

