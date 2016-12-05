function [ rezultat ] = functieRepartitieY( x, lambda )
    if x <= 0
        rezultat = 0;
    else    
        rezultat = 1 - x ^ (-lambda);
    end
end

