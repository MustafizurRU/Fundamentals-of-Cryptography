#include<bits/stdc++.h>
using namespace std;

int Encrypt_Decrypt(int mgs,int ed,int n){
    long long p = mgs;
    while(--ed)
        p  = (p*mgs)%n;
    return p;
}

int main(){
    int p, q, n, tot, e, d;
    p = 17; q = 11; n = p*q;
    tot = (p-1)*(q-1);
    e = 7; d = 23;

    string str;
    getline(cin,str);   ///cin >> str;
    int text[str.size()];
    for(int i=0; i<str.size(); i++) text[i]=(int)str[i];

    /// Encryption part...
    printf("The Cipher text is : ");
    for(int i=0; i<str.size(); i++){
        text[i] = Encrypt_Decrypt(text[i], e, n);
        printf("%c", (text[i]%26)+'a');  ///printf("%d ", text[i]);
    }

    /// Decryption part...
    printf("\nThe Plain text is : ");
    for(int i=0; i<str.size(); i++){
        text[i] = Encrypt_Decrypt(text[i], d, n);
        printf("%c", text[i]);
    }
}
