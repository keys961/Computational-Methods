function [ X ] = GaussianElimination( A, b )
%Gauss Elimination
B = [A, b];
n = length(b);
RA = rank(A);
RB = rank(B);
if(RB - RA > 0)
    disp('No Solution for AX = b')
    return
end

if(RA == RB)
    disp('AX = b have only 1 solution')
    X = zeros(n, 1);
    C = zeros(1, n + 1);
    for p = 1 : n - 1 %Pick p as pivot
        for k = p + 1 : n
            m = B(k, p) / B(p, p);%Get m times
            B(k, p:n+1) = B(k, p:n+1) - m * B(p, p:n+1);%Eliminate
        end
    end
    b = B(1:n, n+1);%b vector
    A = B(1:n, 1:n);%A matrix
    X(n) = b(n) / A(n,n); %Get 1st solution in index n
    for q = n - 1: -1 : 1
        X(q) = (b(q) - sum(A(q, q+1:n) * X(q+1:n)))/A(q,q);
        %Get other solutions from n-1 to 1
    end
else
    disp('AX = b have lots of solutions')
end
end

