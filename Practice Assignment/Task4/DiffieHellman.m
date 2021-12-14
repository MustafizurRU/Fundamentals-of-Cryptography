clc
clear all
close all
p = 7;
g = 5;
a = 3;
b = 4;
%% for premitive root
% p = input('Enter Prime Number P = ');
% g = [];
% for i=1:p-1
%     for j=1:p-1
%         g(i,j) = mod(power(i,j),p);
%     end
%     
% end

%% for X Key generated
x = mod(power(g,a),p);
disp('public key of x = ');
disp(x);

%% for y Key generated
y = mod(power(g,b),p);
disp('public key of Y = ');
disp(y);
%% Exchange of generated keys takes place
x = x+y;
y = x-y;
x = x-y;
%% Generated Secret Key for x
kx = mod(power(x,a),p);
disp('Secret key of x = ');
disp(kx)
%% Generated Secret Key for y
ky = mod(power(y,b),p);
disp('Secret key of y = ');
disp(ky)







