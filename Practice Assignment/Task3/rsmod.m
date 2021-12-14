function [k] = rsmod(msg,ex,n)
    b = mod(msg,n);
    k = b;
    for i = 2:ex
        k = k * b;
        k = mod(k,n);
    end
end
