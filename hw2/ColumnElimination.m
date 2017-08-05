function [ X ] = ColumnElimination( A, b )
B = [A, b];
n = length(b);
RA = rank(A);
RB = rank(B);
if(RB - RA > 0)
    disp('No Solution for AX = b')
    return
end

if(RA == RB)
    disp('Only 1 solution for AX = b')
    X = zeros(n,1);
    C = zeros(1,n+1);
    for p = 1:n-1
        %Pick pivot of max value in p column
        [Y,j] = max(abs(B(p:n,p)));
        C = B(p,:);%Swap row vectors
        B(p,:) = B(j+p-1,:);
        B(j+p-1,:) = C;
        for k = p + 1:n
            %Same as gauss
            m = B(k,p)/B(p,p);
            B(k,p:n+1) = B(k,p:n+1)-m*B(p,p:n+1);
        end
    end
    b = B(1:n,n+1);
    A = B(1:n,1:n);
    X(n) = b(n)/A(n,n);
    for q = n - 1: -1 : 1
        X(q) = (b(q) - sum(A(q, q+1:n) * X(q+1:n)))/A(q,q);
        %Get other solutions from n-1 to 1
    end
else
    disp('AX = b have lots of solutions')
end     
    
end

