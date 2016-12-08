function [ rezultat ] = simulareVariabilaX_Inversa()
    
    x = rand();

    rezultat = 4/(9*((3*x)/2 + (((3*x)/2 - 8/27)^2 - 64/729)^(1/2) - 8/27)^(1/3)) + ....
        ((3*x)/2 + (((3*x)/2 - 8/27)^2 - 64/729)^(1/2) - 8/27)^(1/3) - 2/3;
 

end

