clc; clear; close all;
while(1)
    x = input('\n1. -> Encryption.\n2. -> Decyptrion.\n3. -> BruthForce Attack\n0. -> Exit Program\t:- ');
    switch x
        case 0
            break;
        case 1
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
                    end
                    fwrite(out,text(i),'char');
                end
            end
            disp('Encryption Successful.!!\n');
            fclose(in); fclose(out);
        case 2
            key = input('Enter your key: ');
            in = fopen('cipherText.txt');
            out = fopen('plainTextAgain.txt','w');
            while ~feof(in)
                text = fgets(in);
                for i=1 : length(text)
                    if('A'<= text(i) && text(i) <= 'Z')
                        text(i) = rem((text(i)+26-key-'A'),26)+'A';
                    elseif('a'<=text(i) && text(i)<='z')
                        text(i) = rem((text(i)+26-key-'a'),26)+'a';
                    end
                    fwrite(out,text(i),'char');
                end
            end
            disp('Decryption Successful.!!\n');
            fclose(in); fclose(out);
        case 3
            for key = 1 : 26
                in = fopen('cipherText.txt');
                out = fopen('BruthForceOut.txt','a');
                fwrite(out,num2str(key)); fwrite(out,' -> ');
                while ~feof(in)
                    text = fgets(in);
                    for i=1 : length(text)
                        if('A'<= text(i) && text(i) <= 'Z')
                            text(i) = rem((text(i)+26-key-'A'),26)+'A';
                        elseif('a'<=text(i) && text(i)<='z')
                            text(i) = rem((text(i)+26-key-'a'),26)+'a';
                        end
                        fwrite(out,text(i),'char');
                    end
                end
                fclose(in); fclose(out);
            end
            disp('Bruth-Force Successful.!!\n');
        otherwise
            disp('Opps.!! You entered wrong key.!! Try again the following :-\n');
    end
end
