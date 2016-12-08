function [ rezultat ] = simuleazaVariabilaX( alpha )
    % Simularea variabilei X cu metoda infasuratoarei
    notFound = 1;
    
    while notFound 
        u = rand();
        y = rand();
        
        if u <= (3/2 * y ^ 2 + y) / alpha
            notFound = 0;
            rezultat = y;
        end
    end

end

