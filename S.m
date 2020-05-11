function y = S( x )
%下采样所用函数
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x = abs(x);
if (x>=0)&(x<1)
    y = 1 - 2 * x^2 + x^3;
elseif (x>=1)&(x<2)
    y = 4 - 8 * x + 5 * x^2 - x^3;
elseif x>=2
    y = 0;
end


end

