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
Xg = input('Xg = ');
Yg = input('Yg = ');
s_up = mod((3*power(Xg,2)+a),p);
s_down = mod(2*Yg,p);
[~,a,~] = gcd(s_down,p);
xInv = mod(a,p);
S = mod((s_up*xInv),p);
X2g = mod((power(S,2)-2*Xg),p)
Y2g = mod((S*(Xg-X2g)-Yg),p)
disp(['2G(' num2str(X2g) ',' num2str(Y2g) ')']);
X1 = Xg;
Y1 = Yg;
X2 = X2g;
Y2 = Y2g;
G_index = 3;
while X2~=X1
    s_up = mod((Y2-Y1),p);
    s_down = mod(X2-X1,p);
    [~,a,~] = gcd(s_down,p);
    xInv = mod(a,p);
    S = mod((s_up*xInv),p);
    X = mod((power(S,2)-X1-X2),p);
    Y = mod((mod(S*(X1 - X),p)-Y1),p);
    disp([num2str(G_index) 'G(' num2str(X) ',' num2str(Y) ')']);
    X2 = X;
    Y2 = Y;
    G_index = G_index + 1;
end       
disp([num2str(G_index) 'G = 0']);
disp(['Value of n:' num2str(G_index)]);




