clc; clear; close all;
%% Genarate Key Matrix..
key = lower(input('Enter key : ','s'));
key = strrep(key,'j','i');
key = setdiff(key,' ','stable');

alphabet = 'abcdefghiklmnopqrstuvwxyz';
rem = setdiff(alphabet,key,'stable');
KeyMatrix = reshape([key rem],[5,5])';
disp(num2cell(KeyMatrix));

%% Input from File..
in = fopen('plain.txt');
plain=[]; 
while ~feof(in)
    text = lower(fgets(in));
    text = strrep(text,'j','i');
      %Removing Space & Special Character from text..
    for i=1:length(text)
        if(text(i)>='a' && text(i)<='z')
            plain = [plain text(i)];
        end
    end
end
%% Output file
out = fopen('cipher.txt','w');
disp(['My Input Text : ',plain]);
%% Padding 'x' between same alphabet..
p = []; i=1;
while i<length(plain)
       if(plain(i)=='x' && plain(i+1)=='x')
           p = [p plain(i) 'z'];
           i = i + 1;
       elseif plain(i) == plain(i+1)
           p = [p plain(i) 'x'];
           i = i + 1;
      
       else
           p = [p plain(i) plain(i+1)];
           i = i + 2;
       end
end
if(i==length(plain))
    p=[p plain(i)];
end
if(mod(length(p),2))
    if(p(length(p))=='x')
        p = [p 'z'];
    else
        p = [p 'x'];
    end
end
disp(['Ex_Plain Text : ',p]);
%% Encryption..
for k = 1:2:length(p)
    for i = 1:5
        for j=1:5
            if p(k) == KeyMatrix(i,j)
               r1 = i; c1 = j;
            end
            if p(k+1) == KeyMatrix(i,j)
                r2 = i; c2 = j;
            end
        end
    end
    
    if(r1==r2)
        t(k)=KeyMatrix(r1,mod(c1,5)+1);
        t(k+1)=KeyMatrix(r2,mod(c2,5)+1);
    elseif(c1==c2)
        t(k)=KeyMatrix(mod(r1,5)+1,c1);
        t(k+1)=KeyMatrix(mod(r2,5)+1,c2);
    else
        t(k)=KeyMatrix(r1,c2);
        t(k+1)=KeyMatrix(r2,c1);
    end
end
fwrite(out,t);
disp(['PF_Ciphertext : ',t]);

%% Decryption..
for k = 1:2:length(t) 
    for i = 1:5
        for j=1:5
            if t(k) == KeyMatrix(i,j)
               r1 = i; c1 = j;
            end
            if t(k+1) == KeyMatrix(i,j)
                r2 = i; c2 = j;
            end
        end
    end
    
    if(r1==r2)
        c1(c1==1)=6; c2(c2==1)=6;
        d(k)=KeyMatrix(r1,c1-1);
        d(k+1)=KeyMatrix(r2,c2-1);
    elseif(c1==c2)
        r1(r1==1)=6; r2(r2==1)=6;
        d(k)=KeyMatrix(r1-1,c1);
        d(k+1)=KeyMatrix(r2-1,c2);
    else
        d(k)=KeyMatrix(r1,c2);
        d(k+1)=KeyMatrix(r2,c1);
    end
end
disp(['Decryptedtext with (x) : ',d]);