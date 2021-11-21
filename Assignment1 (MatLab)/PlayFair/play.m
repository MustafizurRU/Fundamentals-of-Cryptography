clc; clear; close all;
alphabet = 'abcdefghiklmnopqrstuvwxyz';
p = lower(input('Enter plaintext : ','s'));
p = strrep(p,'j','i');
k = lower(input('Enter key : ','s'));
k = setdiff(k,'j','stable');
r = setdiff(alphabet,k,'stable');
matrix = reshape([k r],[5,5]);
index = [];temp = []; j = 1;i = 1;
while i < length(p)
       if p(i) == p(i+1)
           temp(j) = p(i);
           j = j + 1;
           temp(j) = 'x';
           index = [index,j];
           j = j + 1;
           i = i + 1;
       else
           temp(j) = p(i);
           j = j + 1;
           temp(j) = p(i+1);
           j = j + 1;
           i = i + 2;
       end
end
if i == length(p)
    temp(j) = p(i);
end

p = temp; q = p;
if mod(length(p),2)
    q = [q,'x'];
end
c = []; d = [];
for i = 1:2:length(q)
    [c(i), c(i+1)] = pfencrypt(q(i),q(i+1),matrix);
end 
disp(['Plaintext : ',q]);
disp(['Ciphertext : ',c]);
for i = 1:2:length(c)
    [d(i), d(i+1)] = pfdecrypt(c(i),c(i+1),matrix);
end
disp(['Decryptedtext : ',d(1:length(p))]);