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
%% for file input
in = fopen('plain.txt');
p = fgets(in);
%% for output 
out = fopen('cipher.txt','w');
plain=[];   %Removing Space & Special Character from text..
for i=1:length(p)
    if(p(i)>='a' && p(i)<='z' || p(i)>='A' && p(i)<='Z' )
        plain = [plain p(i)];
    end
end
disp(['My Input Text : ',plain]);
%% for encryption
for i = 1:length(plain)
        c(i) = rsmod(plain(i),e,n);
end
fwrite(out,num2str(c));
fwrite(out,sprintf('\n'));
fwrite(out,c);
% fwrite(out,char(rem(c,26)+'a'));
disp(['Ciphertext : ' char(rem(c,26)+'a')]);
%% for decryption
for i = 1:length(c)
        m(i) = rsmod(c(i),d,n);
end
disp(['decryptedtext : ',m]);