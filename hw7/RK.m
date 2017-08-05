function [res] = RK(initVal, h)
%R-K method
f = @(x, y)(2*x/(3*y*y)); %f(x,y)
res = zeros(11,1);
res(1) = initVal;
i = 2;
for x = 0:h:(1-h)
	K1 = f(x,res(i-1));
	K2 = f(x+h/2,res(i-1)+h/2*K1);
	K3 = f(x+h/2,res(i-1)+h/2*K2);
	K4 = f(x+h,res(i-1)+h*K3);
	res(i) = res(i-1) + h/6*(K1+2*K2+2*K3+K4);
	i = i + 1;
end