function [ inversa ] = determinaInversa()
    syms x
    f(x) = 1-exp(-x^2);
    inversa = finverse(f);
end

