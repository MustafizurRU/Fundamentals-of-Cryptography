clc;
clear;
close all;
%p and q both prime number but p!=q
% p = 13;
% q = 11;
p = input('P = ');
q = input('q = ');
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
in = fopen('cipher.txt');
plain=[];
while ~feof(in)
    p = fgets(in);
    %Removing Space & Special Character from text..
    for i=1:length(p)
        plain = [plain p(i)];
    end
end
fclose(in);
%% for decryption
for i = 1:length(plain)
    t = plain(i);
    for j=2:d
        t = mod(t*plain(i),n);
    end
    m(i)=t;
end
disp(['decryptedtext : ',sprintf('\n'),m]);