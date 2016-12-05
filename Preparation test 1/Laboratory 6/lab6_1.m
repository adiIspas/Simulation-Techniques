% Curatam spatiul de lucru
clear;
clc;

% Setam parametrii
lambda = 3;
e = exp(1);
numarValoriSelectie = 1000;

% Generam valorile de selectie
valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simulareVariabilaLaplace(lambda);
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
densitate = lambda/2 * e .^ (-lambda * abs(valoriSelectieNoi));

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

probabilitati(1) = functieRepartitieLaplace(a(1),lambda);
for i = 2:numarOptimDreptunghiuri - 1
    probabilitati(i) = functieRepartitieLaplace(a(i),lambda) - functieRepartitieLaplace(a(i-1),lambda);
end
probabilitati(numarOptimDreptunghiuri) = 1 - functieRepartitieLaplace(a(numarOptimDreptunghiuri-1), lambda);

alpha = 0.01;
prag = chi2inv(1-alpha,numarOptimDreptunghiuri - 1);

X_2 = sum(((numarValoriIntervalNescalate - numarValoriSelectie * probabilitati).^2)/(numarValoriSelectie * probabilitati));

% Testam ipoteza
if X_2 <= prag
    disp('Metoda III - Acceptam ipoteza nula')
else
    disp('Metoda III - Respingem ipoteza nula')
end