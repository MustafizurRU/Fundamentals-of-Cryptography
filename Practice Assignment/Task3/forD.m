k=0;
phi = input('Enter O(n)number: ');
e = input('Enter Public key:');
while(1)
    x = (1+(k*phi));
    if(rem(x,e)==0)
        d=x/e
        break;
    end
    k = k+1;
end
        