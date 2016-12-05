% Curatam spatiul de lucru
clear;
clc;

% Setare parametrii
lambda = 10;
numarValoriSelectie = 1000;

% Generam valorile de selectie
valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simulareY(lambda);
end

%valoriSelectie = ex_2a(lambda,n);

% Determinam drumul optim de dreptunghiuri pentru histograma
numarOptimDreptunghiuri = floor(1 + log2(numarValoriSelectie));
[numarValoriInterval, centre] = hist(valoriSelectie, numarOptimDreptunghiuri);

% Scalam aria dreptunghiurilor astfel incat sa fie 1.
numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / (numarValoriSelectie * (centre(2) - centre(1)));

% Determinam densitatea functiei Y
% Generam valori de selectie dintre minim si maxim cu pas de 0.01
valoriSelectieNoi = min(valoriSelectie):0.01:max(valoriSelectie);
densitateY = lambda * (valoriSelectieNoi .^ (-lambda-1));

% Metoda I - Histograma
% Plotam rezultatele
close all;
hold on
title('Simularea variabilei Y');
bar(centre,numarValoriInterval,1,'w');
plot(valoriSelectieNoi,densitateY);
hold off

% Metoda II - Momentele de selectie
% Trebuie determinata media si dispersia teoretica

% Metoda III - Testul X^2

% Deplasam centrele
a = centre + (centre(2) - centre(1))/2;
probabilitati = zeros(1,numarOptimDreptunghiuri);

% Calculam probabilitatile
probabilitati(1) = functieRepartitieY(a(1),lambda);
for i = 2:numarOptimDreptunghiuri - 1
    probabilitati(i) = functieRepartitieY(a(i),lambda) - functieRepartitieY(a(i-1),lambda);
end
probabilitati(numarOptimDreptunghiuri) = 1 - functieRepartitieY(a(numarOptimDreptunghiuri-1),lambda);

% Calculam statistica X^2
X_2 = sum(((numarValoriIntervalNescalate - numarValoriSelectie * probabilitati).^2) ./ (numarValoriSelectie * probabilitati));

% Determinam pragul
alpha = 0.01;
prag = chi2inv(1-alpha,numarOptimDreptunghiuri-1);

% Testam ipoteza
if X_2 <= prag
    disp('Metoda III - Acceptam ipoteza nula')
else
    disp('Metoda III - Respingem ipoteza nula')
end