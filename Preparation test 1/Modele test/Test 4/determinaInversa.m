function [ inversa ] = determinaInversa()
    
    % Determina inversa unei functii (aproximare)
    syms x
    f(x) = (x^3 + x^2)/2;
    inversa = finverse(f(x));

end

