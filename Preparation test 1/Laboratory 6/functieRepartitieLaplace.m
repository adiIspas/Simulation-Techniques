function [ rezultat ] = functieRepartitieLaplace( x, lambda )
    e = exp(1);
    if x < lambda
        rezultat = 1/2 * e^(x-1/lambda);
    else
        rezultat = 1 - 1/2 * e^(-x+1/lambda);
    end
end

