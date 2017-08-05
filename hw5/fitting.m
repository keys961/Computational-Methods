function [ coffs, minPos ] = fitting( X, Y )
%f(x)=a0+a1x+a2x^2
m = length(X);
A = zeros(3,3);
B = [0;0;0];
A(1,1) = m;
x1 = 0; x2 = 0;
x3 = 0; x4 = 0;
y1 = 0; y2 = 0; y3 = 0;
for i = 1 : m
    x1 = x1 + X(i); %Get phi(i,j)
    x2 = x2 + X(i) * X(i);
    x3 = x3 + X(i) * X(i) * X(i);
    x4 = x4 + X(i) * X(i) * X(i) * X(i);
    y1 = y1 + Y(i);
    y2 = y2 + X(i) * Y(i);%get phi(i,f)
    y3 = y3 + X(i) * X(i) * Y(i);
end
A(1,2) = x1; A(2,1) = x1;
A(2,2) = x2; A(1,3) = x2; A(3,1) = x2;
A(2,3) = x3; A(3,2) = x3; A(3,3) = x4;
B(1) = y1; B(2) = y2; B(3) = y3;
coffs = A \ B;%solve the functions
minPos(1) = - coffs(2) / (2 * coffs(3));%minPos & values
minPos(2) = coffs(1) + coffs(2) * minPos(1) + coffs(3) * ...
    minPos(1) * minPos(1);
end

