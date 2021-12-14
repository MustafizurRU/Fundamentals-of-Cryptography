clear all ; close all ; clc
p = 19;
q = 17;
n = p*q;
m = (p-1)*(q-1);

for e = 2:n
    if (gcd(e,m)==1)
        break;
    end
end
fprintf('\n\nPublic Key (%d , %d) \n',e,n);

%% finding Private key

for k=0:3000
    d = (1+(k*m))/e;
    if rem(d ,1)==0
        temp = d*e;
        if (mod(temp ,m)==1)
            private = d;
            break;
        end
    end
end

fprintf('\n\nPrivate Key (%d , %d) \n',private,n);


%% Encryption 

message = 'Saju';

fprintf('\n\nMessage : %s\n',message);
cipher = [];
for i = 1:length(message)
    temp = message(i);
    for j = 2:e
        temp = mod(temp*message(i),n);
    end
    cipher(i) = temp;
end
fprintf('\n\nCipher : %s\n',cipher);


%% Decryption 

for i = 1:length(cipher)
    temp = cipher(i);
    for j = 2:d
        temp = mod(temp*cipher(i),n);
    end
    plain(i) = temp;
end

fprintf('\n\nPlain text : %s\n',plain);















