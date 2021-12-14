clc
clear all
close all
p = input('p = ');
a = input('a= ');
b = input('b = ');
for x=0:p-1
    m(x+1) = mod((power(x,3) + a*x + b),p);
    n(x+1) = mod(x*x,p);
end
disp(m);
disp(n);
for i=0:p-1
    for j=0:p-1
        if(m(i+1) == n(j+1))
            sprintf('(%d,%d)',i,j)
        end
    end
end
