% Curatam spatiul de lucru
clear
clc

% Setam parametrii
numarValoriSelectie = 1000;
n = 3;

% Generam valori de selectie
valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simuleazaMinim(n);
end

% Determinam numarul optim de dreptunghiuri
numarOptimDreptunghiuri = floor(1 + log2(numarValoriSelectie));
[numarValoriInterval, centre] = hist(valoriSelectie, numarOptimDreptunghiuri);

% Scalam a.i. aria de sub grafic sa fie 1
numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / (numarValoriSelectie * (centre(2) - centre(1)));

% Calculam densitatea
valoriSelectieNoi = min(valoriSelectie):0.01:max(valoriSelectie);
densitateModul = n * (1 - valoriSelectieNoi).^(n-1);

% Metoda de verificare cu Histograma
close all
hold on
bar(centre,numarValoriInterval,1,'y');
plot(valoriSelectieNoi,densitateModul,'r');
hold off

% Metoda de verificare cu testul X^2
a = centre + (centre(2) - centre(1))/2;
probabilitati = zeros(1,numarOptimDreptunghiuri);

% Determinam probabilitatile
probabilitati(1) = functieRepartitieMinim(a(1),n);
for i = 2:numarOptimDreptunghiuri - 1
    probabilitati(i) = functieRepartitieMinim(a(i),n) - functieRepartitieMinim(a(i-1),n);
end
probabilitati(numarOptimDreptunghiuri) = 1 - functieRepartitieMinim(a(numarOptimDreptunghiuri-1),n);

% Calculam statistica X_2
X_2 = sum(((numarValoriIntervalNescalate - numarValoriSelectie * probabilitati).^2) ./ (numarValoriSelectie * probabilitati));

% Determinam pragul
alpha = 0.01;
prag = chi2inv(1-alpha,numarOptimDreptunghiuri-1);

if X_2 <= prag
    disp('Aceptam ipoteza');
else
    disp('Respingem ipoteza');
end