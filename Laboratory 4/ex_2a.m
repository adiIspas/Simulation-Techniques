function [ U ] = ex_2a( lambda, n )

     U = rand(1,n);
     U = power((1./(1-U)),1/lambda);

end

