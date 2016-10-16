function [result] = aplicatie_2( u, v )

    suma = (u(1,:) - v(1,:)) .^2;
    suma = sum(suma);
    
    result = sqrt(suma);
end

