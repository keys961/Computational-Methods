function [res] = Euler(initVal, h)
%Eular method
f = @(x, y)(2*x/(3*y*y)); %f(x,y)
res = zeros(11,1);
res(1) = initVal;
i = 2;
for x = 0:h:(1-h)
	res(i) = res(i-1) + h*f(x,res(i-1));
	i = i + 1;
end