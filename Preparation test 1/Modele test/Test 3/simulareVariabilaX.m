function [ rezultat ] = simulareVariabilaX()
    x = rand();
    rezultat = (-log(1 - x))^(1/2);
end

