% Curatam spatiul de lucru
clear;
clc;

% Setam parametrii
lambda = 3;
a_1 = 8;
b = 4;
e = exp(1);
numarValoriSelectie = 1000;

% Generam valorile de selectie
valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simulareVariabilaLomax(lambda,a_1,b);
end

% Determinam numarul optim de dreptunghiuri
numarOptimDreptunghiuri = floor(1+log2(numarValoriSelectie));
[numarValoriInterval, centre] = hist(valoriSelectie,numarOptimDreptunghiuri);

% Scalam a.i. aria de sub grafic sa fie 1.
numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / (numarValoriSelectie * (centre(2) - centre(1)));

% Metoda I - Histograma
% Determinam densitatea
valoriSelectieNoi = min(valoriSelectie):0.1:max(valoriSelectie);
O = lambda/b;
densitate = (a_1 * O) ./ (O*valoriSelectieNoi + 1) .^ (a_1 + 1);

% Plotam graficele
close all;
hold on
bar(centre,numarValoriInterval,1,'w');
plot(valoriSelectieNoi,densitate);
hold off

% Metoda II - Momentele de selectie
% 

% Metoda III - Testul X^2
a = centre + (centre(2) - centre(1))/2;
probabilitati = zeros(1,numarOptimDreptunghiuri);

probabilitati(1) = functieRepartitieLomax(a(1),a_1,b);
for i = 2:numarOptimDreptunghiuri - 1
    probabilitati(i) = functieRepartitieLomax(a(i),a_1,b) - functieRepartitieLomax(a(i-1),a_1,b);
end
probabilitati(numarOptimDreptunghiuri) = 1 - functieRepartitieLomax(a(numarOptimDreptunghiuri-1), a_1,b);

alpha = 0.01;
prag = chi2inv(1-alpha,numarOptimDreptunghiuri - 1);

X_2 = sum(((numarValoriIntervalNescalate - numarValoriSelectie * probabilitati).^2)/(numarValoriSelectie * probabilitati));

% Testam ipoteza
if X_2 <= prag
    disp('Metoda III - Acceptam ipoteza nula')
else
    disp('Metoda III - Respingem ipoteza nula')
end