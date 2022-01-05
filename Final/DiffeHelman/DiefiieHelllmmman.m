clc
clear all
close all
%private key
a = 3;
b = 4;
%% for premitive root
p = input('Enter Prime Number P = ');
g = [];
for i=1:p-1
    for j=1:p-1
        if j==1
            g(i,j) = mod(i^j,p);
        else
            g(i,j) = mod(g(i,j-1)*i, p);
        end
    end
    
end
root = [];
for i=1:p-1
    t = g(i, :);
    if length(t) == length(unique(t))
        root = [root i];
    end
end
fprintf('%s has %s Primitive roots :',num2str(p),num2str(length(root)));
disp(root);
g = input('Select any primitive root : ');
%% for X Key generated
x = pow_mod(g,a,p);
disp('public key of x = ');
disp(x);

%% for y Key generated
y = pow_mod(g,b,p);
disp('public key of Y = ');
disp(y);
%% Exchange of generated keys takes place
x = x+y;
y = x-y;
x = x-y;
%% Generated Secret Key for x
kx = pow_mod(x,a,p);
disp('Secret key of x = ');
disp(kx)
%% Generated Secret Key for y
ky = pow_mod(y,b,p);
disp('Secret key of y = ');
disp(ky)







