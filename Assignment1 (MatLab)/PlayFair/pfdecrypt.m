function [ch1,ch2] = pfdecrypt(ch1,ch2,matrix)
    for i = 1:5
        for j = 1:5
            if ch1 == matrix(i,j)
                m1 = i; n1 = j;
            elseif ch2 == matrix(i,j)
                m2 = i; n2 = j;
            end
        end
    end
    if ch1 == ch2
        m2 = m1; n2 = n1;
    end
    if m1 == m2 && n1 == 1
        ch1 = matrix(m1,5);
    elseif m1 == m2 && n1 ~= 1
        ch1 = matrix(m1,n1-1);
    end
    if m1 == m2 && n2 == 1
        ch2 = matrix(m2,5);
    elseif m1 == m2 && n2 ~= 1
        ch2 = matrix(m2,n2-1);
    end
    if n1 == n2 && m1 == 1
        ch1 = matrix(5,n1);
    elseif n1 == n2 && m1 ~= 1
        ch1 = matrix(m1-1,n1);
    end
    if n1 == n2 && m2 == 1
        ch2 = matrix(5,n2);
    elseif n1 == n2 && m2 ~= 1
        ch2 = matrix(m2-1,n2);
    end
    if m1 ~= m2 && n1 ~= n2
        ch1 = matrix(m1,n2);
        ch2 = matrix(m2,n1);
    end
end