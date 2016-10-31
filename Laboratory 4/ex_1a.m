function [ U ] = ex_1a( lambda, n )

    U = rand(1,n);
    U = -1/lambda * log(U);
 
end

