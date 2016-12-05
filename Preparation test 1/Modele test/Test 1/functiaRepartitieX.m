function [ rezultat ] = functiaRepartitieX( x )
    if x >= 0 && x <= 1
        rezultat = (x^3)/3 + (2*(x^2))/3;
    else
        rezultat = 0;
    end
end

