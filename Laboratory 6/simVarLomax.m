function x = simVarLomax(lambda, a, b)

%     f(x) = ( a * O ) / (O*x+1) ^ (a+1)
%     O = lambda / b;
%     
%     
%    Y = gama(0,b,a);
   
   % cod
   
   y = gamrnd(a,1/b);
   x = exprnd(1/(lambda * y));
end

