clc
clear all
while(1)
    x = input(' 1: Encryption \n 2: Decryption \n 3: BruteForce \n 0: Exit \n Enter Following Number: ');
    switch x
        case 0
            break;
        case 1
            caesar_Cipher_One
        case 2
            caesar_Cipher_Two
        case 3
            caesar_Cipher_Three
        otherwise
            disp('Opps.!! You entered wrong key.!! Try again the following :-\n');
    end
end