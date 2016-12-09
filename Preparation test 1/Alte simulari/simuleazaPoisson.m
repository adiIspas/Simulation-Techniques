function [ rezultat ] = simuleazaPoisson( lambda, p )
    n = floor(lambda/p);
    rezultat = binornd(n,p);
end

