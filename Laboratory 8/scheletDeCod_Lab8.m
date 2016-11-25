function scheletDeCod_Lab8()

close all
clear
clc

% Parametrul variabilei X ~ Exp(lambda)
lambda = 2;

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% 2. Generarea unei multimi de 1000 de valori de selectie asupra v.a. X.

n = 10000; % dimensiunea multimii de valori de selectie
X = zeros(1, n);
for i = 1 : n
    % COMPLETATI!!!
    X(i) = simExp(lambda);
end


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% Punctul 3: Studiati multimea de valori de selectie obtinuta la punctul 2.
% folosind cele trei metode de validare a algoritmilor de simulare descrise
% in curs:

% 3 (a) - Histograma - o validare empirica a algoritmului de simulare

k = floor(1 + log2(n)); % numarul de dreptunghiuri
[N, C] = hist(X, k);
bar(C, N/(n * (C(2) - C(1))), 1, 'w');

hold on
e = exp(1);
% Adaugam in acelasi grafic cu histograma densitatea de repartitie a
% variabilei Exponentiale
x = min(X) : 0.1 : max(X);
densitate = lambda * e .^ (-lambda .* x);
plot(x,densitate);
hold off

%--------------------------------------------------------------------------

% 3 (b) - Testul bazat pe momentele de selectie

% Media si dispersia variabilei Exponentiale - valorile teoretice
mediaTeoretica = 1/lambda;
dispersiaTeoretica = 1/(lambda^2);

% Media de selectie si dispersia de selectie ale variabilei Exponentiale
% Se poate folosi functia mean - vezi help
% COMPLETATI!!!
mediaEstimata = mean(X);
% Se poate folosi functia var - vezi help
% COMPLETATI!!!
dispersiaEstimata = var(X);

eroareMedia = abs(mediaEstimata - mediaTeoretica);
eroareDispersia = abs(dispersiaEstimata - dispersiaTeoretica);

disp('Eroarea medie este ');
disp(eroareMedia);
disp('Eroarea dispersie este ');
disp(eroareDispersia);

% Considerati n = 10000, observati ca erorile vor scadea!

%--------------------------------------------------------------------------

% 3 (c) - Testul X^2

%Observatii: 

% Vectorul N returnat de functia hist contine N = [f1, f2, ..., fk].

% Punctele a1, a2, ..., ak pot fi obtinute translatand la dreapta cu o
% jumatate de interval (adica (C(2) - C(1))/2 ) punctele asociate centrelor
% intervalelor de la baza; centrele sunt returnate in vectorul C de catre 
% functia hist. Definim vectorul a = [a1, a2, ..., ak]
a = C + (C(2) - C(1))/2;

% Construim vectorul p = [p1, p2, ..., pk]
p = zeros(1, k);
% COMPLETATI!!!
p(1) = F(a(1),lambda);
for i = 2 : k - 1
    % COMPLETATI!!!
    p(i) = F(a(i),lambda) - F(a(i-1),lambda);
end
% COMPLETATI!!!
p(k) = 1 - F(a(k-1),lambda);

% Calculam statistica X^2
X2 = sum(((N - n * p) .^ 2) ./ (n * p));

% cuantila superioara de ordin 1 - alpha a variabilei chi2 (hi patrat), 
% notata 'prag', unde alpha este o valoare mica
% k - 1 reprezinta numarul gradelor de libertate
alpha = 0.01;
prag = chi2inv(1 - alpha, k - 1);

% Testul X^2
if X2 <= prag
    disp('Acceptam ipoteza nula: X are functia de repartitie F(x)')
else
    disp('Respingem ipoteza nula')
end

end

% Punctul 1: Functie pentru simularea variabilei aleatoare X ~ Exp(lambda)
% folosind Algoritmul bazat pe Teorema sirului descendent

function x = simExp(lambda)
    n = -1;
    k = 0;
    
    while mod(k,2) == 0
        n = n + 1;
        z0 = rand();
        z1 = rand();
        z = z0;

        k = 1;

        while z1 < z0
            k = k + 1;
            z0 = z1;
            z1 = rand();
        end
    end
    
    x = (n + z) / lambda;
end

% Functie ce calculeaza valoarea functiei de repartitie Exponentiale intr-un
% punct x
function rez = F(x, lambda)
	rez = exppdf(x,lambda);
end




