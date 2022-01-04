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
disp(points);
%% for subgroup
Xg = input('X1 from affine points = ');
Yg = input('Y1 from affine points = ');
subg = subgroup(Xg,Yg,a,P);
%% for key exchange
%private key
m = input('Enter private key m = ');
n = input('Enter private key n = ');
Pm = subg(m,:);
Pn = subg(n,:);
disp(['Public key of m = ','(' num2str(Pm(:,1)) ',' num2str(Pm(:,2)) ')']);
disp(['Public key of n = ','(' num2str(Pn(:,1)) ',' num2str(Pn(:,2)) ')']);
%key exchange
X = Pm;
Pm = Pn;
Pn = X;
disp(['Exchange Public key of m = ','(' num2str(Pm(:,1)) ',' num2str(Pm(:,2)) ')']);
disp(['Exchange Public key of n = ','(' num2str(Pn(:,1)) ',' num2str(Pn(:,2)) ')']);
%for Private key of m calculation
Xg = Pm(:,1);
Yg = Pm(:,2);
sub2 = subgroup(Xg,Yg,a,P);
disp(['Private key of m = ','(' num2str(sub2(m,1)) ',' num2str(sub2(m,2)) ')']);
%for Private key of n calculation
Xg = Pn(:,1);
Yg = Pn(:,2);
sub2 = subgroup(Xg,Yg,a,P);
disp(['Private key of n = ','(' num2str(sub2(n,1)) ',' num2str(sub2(n,2)) ')']);
