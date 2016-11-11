function x = simVarLaplace(lambda)
    u = unifrnd(0,1);
    
    if u <= 0.5
        s = 1;
    else
        s = -1;
    end
    
    x1 = exprnd(1/lambda);
    
    x = s*x1;
end

