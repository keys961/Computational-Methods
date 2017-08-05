function [ res ] = Standard(  )
%Standard result
res = zeros(11,1);
i = 1;
for x=0:0.1:1
    res(i) = power(1+x*x,1/3);
    i = i+1;
end
end

