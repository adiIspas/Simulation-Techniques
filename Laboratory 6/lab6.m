%% Curatam spatiul de lucru
clear
clc

%% Datele de intrare
n = 100;
lambda = 1;
a = 2;
b = 1;
optiune = 'Lomax';

%% Simularea variabilei Laplace
if strcmp(optiune,'Laplace')
    x = zeros(1,n);
    for i = 1:n
        x(i) = simVarLaplace(lambda); 
    end

    k = floor(1+log2(n));
    [N,X] = hist(x,k);

    % Scalam a.i. aria de sub grafic sa fie 1
    N = N/(n*(X(2)-X(1)));
    e = 2.71828182846;

    hold on
    bar(X,N,1,'w');
    v = min(x):0.01:max(x);
    densitate = (lambda/2) * power(e,-lambda*(abs(v))); 
    plot(v,densitate);
    hold off;
else
%% Simularea variabilei Lomax
    x = zeros(1,n);
    for i = 1:n
        x(i) = simVarLomax(lambda,a,b); 
    end
    
    k = floor(1+log2(n));
    [N,X] = hist(x,k);

    % Scalam a.i. aria de sub grafic sa fie 1
    N = N/(n*(X(2)-X(1)));
    O = lambda/b;

    hold on
    bar(X,N,1,'w');
    v = min(x):0.01:max(x);
    densitate = (a * O) ./ (O*v + 1) .^ (a + 1); 
    plot(v,densitate);
    hold off;
end


