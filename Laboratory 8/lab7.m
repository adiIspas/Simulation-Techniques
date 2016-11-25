% Curatam spatiul de lucru
clear
clc

% Setam parametrii
alpha = 0;
lambda = 1;
v = 0.5;
n = 1000;

%% Simularea variabilei Gamma
    x = zeros(1,n);
    for i = 1:n
        x(i) = myGamma(alpha,lambda,v); 
    end

    k = floor(1+log2(n));
    [N,X] = hist(x,k);

    % Scalam a.i. aria de sub grafic sa fie 1
    N = N/(n*(X(2)-X(1)));
    e = exp(1);

    hold on
    bar(X,N,1,'w');
    valori = min(x):0.01:max(x);
    % x - alpha = locatia
    % v = forma
    % 1/lambda = scala
    densitate = gampdf(x-alpha,v,1/lambda);
    plot(valori,densitate);
    hold off;

