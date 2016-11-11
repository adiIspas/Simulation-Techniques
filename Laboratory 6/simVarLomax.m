function x = simVarLomax(lambda, a, b)
   y = gamrnd(a,1/b);
   
   x = exprnd(1/(lambda * y));
end

