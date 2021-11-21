clc; clear; close all;

in = fopen('key.txt');
val = fgets(in);
e = containers.Map(num2cell('a':'z'),num2cell(val));
E = containers.Map(num2cell('A':'Z'),num2cell(char(val-32)));
d = containers.Map(num2cell(val),num2cell('a':'z'));
D = containers.Map(num2cell(char(val-32)),num2cell('A':'Z'));
while(1)
    x = input('\n1. -> Encryption.\n2. -> Decyptrion.\n3. -> Frequency Analysis\n0. -> Exit Program\t:- ');
    switch x
        case 0
            break;
        case 1
            in = fopen('plainText.txt');
            out = fopen('cipherText.txt','w');
            while ~feof(in)
                text = fgets(in);
                for i=1 : length(text)
                    if('A'<= text(i) && text(i) <= 'Z')
                        text(i) = E(text(i));
                    elseif('a'<=text(i) && text(i)<='z')
                        text(i) = e(text(i));
                    end
                    
                    fwrite(out,text(i),'char');
                end
            end
            disp('Encryption Successful.!!\n');
            fclose(in); fclose(out);
        case 2
            in = fopen('cipherText.txt');
            out = fopen('plainTextAgain.txt','w');
            while ~feof(in)
                text = fgets(in);
                for i=1 : length(text)
                    if('A'<= text(i) && text(i) <= 'Z')
                        text(i) = D(text(i));
                    elseif('a'<=text(i) && text(i)<='z')
                        text(i) = d(text(i));
                    end
                    fwrite(out,text(i),'char');
                end
            end
            disp('Decryption Successful.!!\n');
            fclose(in); fclose(out);
        case 3
            frequency = zeros(1,26);
            in = fopen('cipherText.txt');
            while ~feof(in)
                text = fgets(in);
                for i=1 : length(text)
                    if('A'<= text(i) && text(i) <= 'Z')
                        frequency(text(i)-64)=frequency(text(i)-64)+1;
                    elseif('a'<=text(i) && text(i)<='z')
                        frequency(text(i)-96)=frequency(text(i)-96)+1;
                    end
                end
            end
            hist(1:26,frequency);
            disp('Analysis Successful.!!\n');
            fclose(in);
        otherwise
            disp('Opps.!! You entered wrong key.!! Try again the following :-\n');
    end
end
