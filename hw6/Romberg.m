function [ result ] = Romberg( a, b, e, k0)
%Romberg algorithm
%   @param: a: lower bound
%   @param: b: upper bound
%   @param: e: error value
%   @param: k0: max iterate number
%   @return: result: the length of eclipse
% change original equalation to the fun to get length
% len = Integral(0 to 2pi)(fun)
fun = @(theta)...
    (10*(sqrt(4*sin(theta)*sin(theta)+cos(theta)*cos(theta))));
T0 = (b - a) * (fun(a)+fun(b)) / 2;
T = zeros(k0, 4); %1: T, 2: S, 3: C, 4: R
for i = 1 : k0
    if i == 1
        T(1,1) = 0.5 * T0 + (b - a) * 0.5 * fun((a+b)/2);
        T(2,1) = 4*T(1,1)/3 - T0/3;
    elseif i == 2
         T(1,2) = 0.5*T(1,1)+(b-a)/4*(fun((b+3*a)/4)+fun((3*b+a)/4));
         T(2,2) = 4*T(1,2)/3 - T(1,1)/3;
         T(3,2) = 16*T(2,2)/15 - T(2,1)/15;
    else
        T(1,i) = 0.5*T(1,i-1);
        sum = 0;
        for j = 1 : power(2,i-1)
            sum = sum + fun(a+(2*j-1)*(b-a)/power(2,i));
        end
        T(1,i) = T(1,i) + (b-a)/power(2,i)*sum;%Get T
        T(2,i) = 4*T(1,i)/3 - T(1,i-1)/3;%Get S
        T(3,i) = 16*T(2,i)/15 - T(2,i-1)/15;%Get C
        T(4,i) = 16*T(3,i)/15 - T(3,i-1)/15;%Get R
        if abs(T(4,i) - T(4,i-1)) < e %Judge
            result = T(4,i);
            break;
        end
    end 
end
end

