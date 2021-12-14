clc;
clear;
close all;
%p and q both prime number but p!=q
p = 17;
q = 11;
n = p * q;
phi = (p - 1)*(q - 1);
e = 7;
%for d calculation
k=0;
while(1)
    x = (1+(k*phi));
    if(rem(x,e)==0)
        d=x/e;
        break;
    end
    k = k+1;
end
disp('Public key : '); 
disp([e,n]);
disp('Private key : ');
disp([d,n]);

in = fopen('input.txt');
p = fgets(in);
for i = 1:length(p)
        c(i) = rsmod(p(i),e,n);
end
disp(['Ciphertext : ' char(rem(c,26)+'a')]);

for i = 1:length(c)
        m(i) = rsmod(c(i),d,n);
end
disp(['decryptedtext : ',m]);