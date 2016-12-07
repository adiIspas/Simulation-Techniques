% Curatam spatiul de lucru
clear
clc

% Setam parametrii
lambda = 1;
numarValoriSelectie = 1000;
e = exp(1);

% Generam valori de selectie
valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simulareVariabilaExponentiala(lambda);
end

% Determinam numarul optim de dreptunghiuri
numarOptimDreptunghiuri = floor(1 + log2(numarValoriSelectie));
[numarValoriInterval, centre] = hist(valoriSelectie,numarOptimDreptunghiuri);

% Scalam a.i. aria de sub grafic sa fie 1
numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / (numarValoriSelectie * (centre(2) - centre(1)));

% Determinam densitatea
valoriSelectieNoi = min(valoriSelectie):0.01:max(valoriSelectie);
densitateExponentiala = lambda * e .^ (-lambda * valoriSelectieNoi);

% Metoda I - Histograma
close all
hold on
bar(centre,numarValoriInterval,1,'y');
plot(valoriSelectieNoi,densitateExponentiala);
hold off;

