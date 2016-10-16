function [ result ] = aplicatie_6( v )
    [sorted, index] = sort(v, 2, 'descend');
    
    m = uint16(size(v,2)/3);
    if mod(size(v,2),2) == 0
        indici = 1:2:2*m;
    else
        indici = 2:2:2*m;
    end
    
    v(index(indici)) = [];
    
    result = v;
end

