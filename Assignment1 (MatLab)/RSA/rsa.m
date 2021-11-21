clc; clear; close all;

p = 17; q = 11; n = p * q;
tot = (p - 1)*(q - 1);
% e = select(tot);
e = 7;
% d = extendeduclid(tot,e);
d = 23;
disp('Public key : '); disp([e,n]);
disp('Private key : '); disp([d,n]);

in = fopen('plain.txt');
p = fgets(in);
for i = 1:length(p)
        c(i) = rsmod(p(i),e,n);
end
disp(['Ciphertext : ' char(rem(c,26)+'a')]);

for i = 1:length(c)
        m(i) = rsmod(c(i),d,n);
end
disp(['decryptedtext : ',m]);