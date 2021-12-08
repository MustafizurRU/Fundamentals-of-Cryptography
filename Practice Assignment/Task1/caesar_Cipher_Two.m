clc
clear all
close all
key = input('Enter your key: ');
in = fopen('cipherText.txt');
out = fopen('plaintextagain.txt','w');
while ~feof(in)
   text = fgets(in);
   for i=1 : length(text)
       if('A'<=text(i) && text(i)<='Z')
           text(i) = rem((text(i)+26-key-'A'),26)+'A';
       elseif('a'<=text(i) && text(i)<='z')
           text(i) = rem((text(i)+26-key-'a'),26)+'a';
       elseif('0'<=text(i) && text(i)<='9')
           text(i) = rem((text(i)+10-key-'0'),10)+'0';
           %for special character
%        else
%            text(i) = rem((text(i)-key-' '),26)+' ';
       end
       fwrite(out,text(i),'char');
   end
   disp(text);
end
disp('Decryption Successful')
fclose(in);
fclose(out);
           