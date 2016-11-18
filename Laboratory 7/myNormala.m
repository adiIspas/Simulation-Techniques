function [ x ] = myNormala( mu, sigma )

    found = 0;
    
    while found == 0
        u = rand();
        y = exprnd(1);

        e = exp(1);

        cond = e ^ ((-y^2)/2 + y -0.5);

        if u <= cond
            found = 1;
        end
    end
    
    
    u1 = rand();
    
    if u1 <= 0.5
        z = y;
    else
        z = -y;
    end
    
    x = (sigma * z) + mu;
end

