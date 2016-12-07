% Curatam spatiul de lucru
clear;
clc;

% Setam parametrii
numarValoriSelectie = 1000;
valoriSelectie = zeros(1,numarValoriSelectie);
e = exp(1);

% Generam valori de selectie
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simulareVariabilaX();
end

% Determinam numarul optim de dreptunghiuri
numarOptimDreptunghiuri = floor(1 + log2(numarValoriSelectie));
[numarValoriInterval, centre] = hist(valoriSelectie, numarOptimDreptunghiuri);

% Scalam a.i. aria de sub grafic sa fie 1
numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / (numarValoriSelectie * (centre(2) - centre(1)));

% Determinam densitatea
valoriSelectieNoi = min(valoriSelectie):0.001:max(valoriSelectie);
densitate = 2 * valoriSelectieNoi .* e.^(-valoriSelectieNoi.^2);

% Metoda I - Histograma
close all
hold on
bar(centre,numarValoriInterval,1,'y');
plot(valoriSelectieNoi,densitate,'r');
hold off

% Reprezentare grafica pentru intervalul [0,10]
x = 0:0.001:10;
f_x = 2 * x .* e.^(-x.^2);

figure
hold on
bar(centre,numarValoriInterval,1,'y');
plot(x,f_x,'b');
hold off

% Metoda II - Testul X^2
% Determinam probabilitatile
a = centre + (centre(2) - centre(1))/2;
probabilitati = zeros(1,numarOptimDreptunghiuri);
probabilitati(1) = functieRepartitieX(a(1));
for i = 2:numarOptimDreptunghiuri - 1
    probabilitati(i) = functieRepartitieX(a(i)) - functieRepartitieX(a(i - 1));
end
probabilitati(numarOptimDreptunghiuri) = 1 - functieRepartitieX(a(numarOptimDreptunghiuri - 1));

% Calculam statistica X^2
X_2 = sum (((numarValoriIntervalNescalate - numarValoriSelectie*probabilitati).^2) ./ (numarValoriSelectie*probabilitati));

% Determinam pragul
alpha = 0.01;
prag = chi2inv(1-alpha,numarOptimDreptunghiuri-1);

if X_2 <= prag
    disp('Acceptam ipoteza');
else
    disp('Respingem ipoteza');
end