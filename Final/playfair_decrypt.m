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
in = fopen('cipher.txt');
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
disp(['PF_Ciphertext : ',plain]);
%% Decryption..
for k = 1:2:length(plain) 
    for i = 1:5
        for j=1:5
            if plain(k) == KeyMatrix(i,j)
               r1 = i; c1 = j;
            end
            if plain(k+1) == KeyMatrix(i,j)
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