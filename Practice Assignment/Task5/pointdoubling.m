function [x2 y2] = pointdoubling(x1,y1,a,p)
    if (y1 == 0)
        error('pointDouble error: y1 cannot equal 0');
    end
    numerator = mod(3 * x1.^2 + a, p);
    denominator = mod(modInv(2 * y1, p), p);
    s = mod(numerator * denominator, p);
    x2 = mod(s.^2 - 2 * x1, p);
    y2 = mod(-y1 + s * (x1 - x2), p);
end