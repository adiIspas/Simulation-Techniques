function [ result ] = aplicatie_5( n )
    if n == 0
        result = 0;
    elseif n == 1
        result = 1;
    else
        result = aplicatie_5(n - 1) + aplicatie_5(n - 2);
    end
end

