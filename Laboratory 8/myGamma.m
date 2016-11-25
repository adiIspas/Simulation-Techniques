function [ y ] = myGamma(alpha, lambda, v)
    
    found = 0;
    e = exp(1);
    
    f = x ^ (v - 1) * e ^ (-x);
    h = x ^ (v - 1) * e ^ (-x^v);
    
    while found == 0
        u = rand();
        z = (-ln(u)).^(1/v);
        
        if u <= (f/h)
            found = 1;
        end
     end


    y = alpha + z/lambda;
end

