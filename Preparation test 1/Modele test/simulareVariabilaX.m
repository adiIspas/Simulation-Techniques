function [ rezultat ] = simulareVariabilaX( alpha )
    notFound = 1;
    
    while notFound
        u = rand();
        y = rand();
        
        if u <= ((y^2 + 4/3 * y) / alpha)
            notFound = 0;
            rezultat = y;
        end
    end
end

