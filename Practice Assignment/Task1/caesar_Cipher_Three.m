clc
clear all
close all
for key=1:26
    in = fopen('cipherText.txt');
    out = fopen('BruteForceText.txt','a');
    fwrite(out,num2str(key));
    fwrite(out,'=>');
    while ~feof(in)
       text = fgets(in);
       for i=1 : length(text)
           if('A'<=text(i) && text(i)<='Z')
               text(i) = rem((text(i)+26-key-'A'),26)+'A';
           elseif('a'<=text(i) && text(i)<='z')
               text(i) = rem((text(i)+26-key-'a'),26)+'a';
           elseif('0'<=text(i) && text(i)<='9')
               text(i) = rem((text(i)+10-key-'0'),10)+'0';
           end
           fwrite(out,text(i),'char');
           
       end
       
       fwrite(out,newline);
    end
fclose(in);
fclose(out);
end
disp('Bruth-Force Attack Successful')
           