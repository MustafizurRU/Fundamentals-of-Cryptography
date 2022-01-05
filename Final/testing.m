clc
clear all;
close all
p = 17;
a = 4;
b = 4;
x = 0:p-1;
lhs = mod(x.^2,p);
rhs = mod((x.^3 + a*x + b),p);
points = [];
for i=1:length(rhs)
    I = find(lhs==rhs(i));
    for j=1:length(I)
        points = [points;x(i),x(I(j))];
    end
end
fprintf('Affine Points:\n');
for i=1:length(points)
    fprintf('(%d,%d),',points(i,1),points(i,2));
end
fprintf('\nOrder is: %d',length(points));
fprintf('\n');
%point doubling





