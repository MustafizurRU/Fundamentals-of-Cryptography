clc
clear all
close all

key = input('Enter your key: ');
in = fopen('plainText.txt');
out = fopen('cipherText.txt','w');
while ~feof(in)
   text = fgets(in);
   for i=1 : length(text)
       if('A'<= text(i) && text(i) <= 'Z')
            text(i) = rem((text(i)+key-'A'),26)+'A';
       elseif('a'<=text(i) && text(i)<='z')
            text(i) = rem((text(i)+key-'a'),26)+'a';
       elseif ('0'<=text(i) && text(i)<='9')
            text(i) = rem((text(i)+key-'0'),10)+'0';
       end
       fwrite(out,text(i),'char');
       
   end
   disp(text);
       
end  
disp('Encryption Successful.!!\n');

fclose(in); fclose(out);
            