function [ X,k ] = Gseid( A, b, X0, eps )
%GSeid Iteration
D = diag(diag(A));%Get diag(A)
L = -tril(A, -1);%Get -L
U = -triu(A, 1);%Get -U
B = D \ (L + U); %Get Bg
f = D \ b; %Get fg
X = B * X0 + f;%First iteration
k = 1;
%Start Iteration
while norm(X - X0) >= eps
    X0 = X;
    X = B * X0 + f;
    k = k + 1;
end

