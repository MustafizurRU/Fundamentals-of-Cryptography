clc
clear all
close all
P = input('p = ');
a = input('a= ');
b = input('b = ');
x = 0:P-1;
%% for affine points
lhs = mod(x.^2,P);
rhs = mod((x.^3 + a*x + b),P);
points = [];

for i = 1:length(rhs)
    I = find(lhs == rhs(i));
    for j=1:length(I)
        points = [points;x(i),x(I(j))];
    end
end
subplot(1, 1, 1);
plot(points(:,1),points(:,2),'ro');
set(gca,'XTick',0:1:P-1);
set(gca,'YTick',0:1:P-1);
grid on;
title(['Points over F' num2str(P)]);
disp(points);
%% for subgroup
Xg = input('X1 from affine points = ');
Yg = input('Y1 from affine points = ');

subgroup = [];
subgroup = [subgroup;Xg,Yg];
disp(['G(' num2str(Xg) ',' num2str(Yg) ')']);
%% point doubling
S_Up = mod((3*power(Xg,2) + a),P);
S_down = 2*Yg;
[~, a, ~] = gcd(S_down, P);
xInv = mod(a, P);
S = mod((S_Up * xInv),P);
X2g = mod((power(S,2) - 2*Xg),P);
Y2g = mod((S*(Xg - X2g) - Yg),P);
disp(['2G(' num2str(X2g) ',' num2str(Y2g) ')']);
subgroup = [subgroup;X2g,Y2g];

%% point Adding
X1 = Xg;
Y1 = Yg;
X2 = X2g;
Y2 = Y2g;
G_index = 3;
while(X2~=X1)
    S_Up = mod((Y2 - Y1),P);
    S_down = mod((X2 - X1),P);
    [~, a, ~] = gcd(S_down, P);
    xInv = mod(a, P);
    S = mod((S_Up * xInv),P);
    X = mod((S*S - X1 - X2),P);
    Y = mod((mod(S*(X1 - X),P) - Y1),P);
    disp([num2str(G_index) 'G(' num2str(X) ',' num2str(Y) ')']);
    subgroup = [subgroup;X,Y];
    X2 = X;
    Y2 = Y;
    G_index = G_index + 1;
end       
disp([num2str(G_index) 'G = 0']);
disp(['Value of n:' num2str(G_index)]);


