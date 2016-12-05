function [ rezultat ] = simulareVariabilaLomax( lambda, a, b )
    y = gamrnd(a,1/b);
    rezultat = exprnd(1/(lambda * y));
end

