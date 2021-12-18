function [x3, y3] = pointAdd(x1, y1, xQ, yQ, p)
% % Must check if -P = Q --> (xP, -yP mod p)
% if x1 == xQ && y1 == mod(-yQ, p)
%     error('pointAdd error: -P == P');
% end

% Compute the numerator and denominator for mod arithmetic 
numerator = mod(yQ-y1, p);
denominator = mod(modInv(xQ-x1, p), p);

s = mod(numerator * denominator, p);
x3 = mod(s.^2 - x1 - xQ, p);
y3 = mod(-y1 + s * (x1 - x3), p);
end