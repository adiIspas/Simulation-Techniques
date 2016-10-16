function [ result_gcd, result_lcm ] = aplicatie_10( v )
    result_gcd = v(1);
    result_lcm = v(1);

    for i=2:size(v,2)
        result_gcd = gcd(result_gcd,v(2)); 
        result_lcm = lcm(result_lcm,v(2)); 
    end
end

