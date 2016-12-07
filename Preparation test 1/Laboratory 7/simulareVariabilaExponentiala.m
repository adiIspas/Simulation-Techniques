function [ rezultat ] = simulareVariabilaExponentiala( lambda )
    
    n = -1;
    k = 0;
    
    while mod(k,2) == 0
        n = n + 1;
        z0 = rand();
        z1 = rand();
        z = z0;

        k = 1;

        while z1 < z0
            k = k + 1;
            z0 = z1;
            z1 = rand();
        end
    end
    
    rezultat = (n + z) / lambda;
end

