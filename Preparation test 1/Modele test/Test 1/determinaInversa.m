function [ inversa ] = determinaInversa()
    syms x
    f(x) = (x^3)/3 + (2*(x^2))/3;
    inversa = finverse(f);
end

