clc
clear all
close all
p = input('p = ');
a = input('a= ');
b = input('b = ');
x = 0:p-1;
%% for affine points
lhs = mod(x.^2,p);
rhs = mod((x.^3 + a*x + b),p);
points = [];

for i = 1:length(rhs)
    I = find(lhs == rhs(i));
    for j=1:length(I)
        points = [points;x(i),x(I(j))];
    end
end
subplot(1, 1, 1);
plot(points(:,1),points(:,2),'ro');
set(gca,'XTick',0:1:p-1);
set(gca,'YTick',0:1:p-1);
grid on;
title(['Points over F' num2str(p)]);
disp(points);
%% for subgroup
% x1 = points(1,1);
% y1 = points(1,2);
x1 = input('X1 from affine points = ');
y1 = input('Y1 from affine points = ');
subgroup = [];
%point doubling
[x2 y2] = pointdoubling(x1,y1,a,p);
subgroup = [subgroup;x2,y2];
%point Adding
[xR yR] = pointAdd(x1,y1,x2,y2,p);
subgroup = [subgroup;xR,yR];
while (1)
    if(subgroup(:,1)~=x1)
    x2 = xR;
    y2 = yR;
    [xR yR]=pointAdd(x1,y1,x2,y2,p);
    subgroup = [subgroup;xR,yR];
    else
        break;
    end
end
disp('Subgroups are: ');
disp(subgroup);
n=length(subgroup(:,1))+2;
sprintf('The value of n=%d because the subgroup of %dG = O',n,n)

