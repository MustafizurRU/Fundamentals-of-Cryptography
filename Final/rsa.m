clc;
clear;
close all;
%p and q both prime number but p!=q
p = input('Value of P = ');
q = input('Value of Q = ');
n = p * q;
phi = (p - 1)*(q - 1);
% for public key calculation
et = [];
for e = 2:phi-1
    if (gcd(e,phi)==1)
        et = [et;e];
    end
end
disp('public key list: ');
disp(et);
e = input('Choose one public key from list: ');
%for d(private key) calculation
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
plain=[];
while ~feof(in)
    p = fgets(in);
    %Removing Space & Special Character from text..
    for i=1:length(p)
    if(p(i)>='a' && p(i)<='z' || p(i)>='A' && p(i)<='Z'|| p(i)==10 ||p(i)==32)
        plain = [plain p(i)];
    end
    end
end
fclose(in);
%% for output 
out = fopen('cipher.txt','w');
disp(['My Input Text : ',plain]);

%% for encryption
for i = 1:length(plain)
    t = plain(i);
    for j=2:e
        t = mod(t*plain(i),n);
    end
    c(i)=t;
end
fwrite(out,num2str(c));
fwrite(out,sprintf('\n'));
fwrite(out,c);
disp(['Ciphertext : ' char(rem(c,26)+'a')]);
%% for decryption
for i = 1:length(c)
    t = c(i);
    for j=2:d
        t = mod(t*c(i),n);
    end
    m(i)=t;
end
disp(['decryptedtext : ',m]);



