function [x] = pow_mod(base, pow, modulus)

temp = base;
for i = 2:pow
    temp = mod(temp*base, modulus);
end
x = temp;