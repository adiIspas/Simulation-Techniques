function [ rezultat ] = simulareVariabilaNormala( miu, gamma )
    e = exp(1);
    
    notFound = 1;
    while notFound
        
        % Generam 2 valori de selectie uniforme
        u = rand();
        y = exprnd(1);
        
        % Pragul in functie de care cautam y-ul
        prag = e ^ (-(y^2/2) + y - 0.5);
        
        if u <= prag
            notFound = 0;
        end
    end
    
    % Generam o valoare de selectie uniforma
    u1 = rand();
    
    % Determinam semnului
    if u1 <= 0.5
        z = y;
    else
        z = -y;
    end

    % Compunem rezultatul final
    rezultat = gamma*z + miu;
end

