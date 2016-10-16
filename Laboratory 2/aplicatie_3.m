function [ B, C ] = aplicatie_3( m, n )
    B = 1:1:m*n;
    B = reshape(B,m,n);
    B = B';
    
    aux_one = ones(n,1);
    aux_two = 1:1:n;
    C = aux_one * aux_two;
end

