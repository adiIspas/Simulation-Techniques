% Curatam spatiul de lucru
clear
clc

% Setam parametrii
mu = 0;
sigma = 1;
n = 1000;
lambda = 1;
optiune = 'Exp';

%% Simularea variabilelor Normale si Exponentiale
if strcmp(optiune,'Norm')
    %%
    x = zeros(1,n);
    for i = 1:n
        x(i) = myNormala(mu,sigma); 
    end

    k = floor(1+log2(n));
    [N,X] = hist(x,k);

    % Scalam a.i. aria de sub grafic sa fie 1
    N = N/(n*(X(2)-X(1)));
    e = exp(1);

    hold on
    bar(X,N,1,'w');
    v = min(x):0.01:max(x);
    densitate = (1/sqrt(2*sigma^2*pi))*e.^(-(v-mu).^2/(2*sigma^2));
    plot(v,densitate);
    hold off;
else
    %%
    x = zeros(1,n);
    for i = 1:n
        x(i) = myExp(lambda); 
    end

    k = floor(1+log2(n));
    [N,X] = hist(x,k);

    % Scalam a.i. aria de sub grafic sa fie 1
    N = N/(n*(X(2)-X(1)));
    e = exp(1);

    hold on
    bar(X,N,1,'w');
    v = min(x):0.01:max(x);
    densitate = lambda * e .^ (-lambda .* v);
    plot(v,densitate);
    hold off;
end
