% Curatam spatiul de lucru
clear;
clc;

% Setam parametrii
n = 3;
numarValoriSelectie = 1000;

% Generam valorile de selectie
valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    % Putem alege simulareVariabilaX_1 sau simulareVariabilaX_2
    valoriSelectie(i) = simulareVariabilaX_1(n);
end

% Determinam numarul optim de dreptunghiuri
numarOptimDreptunghiuri = floor(1 + log2(numarValoriSelectie));
[numarValoriInterval, centre] = hist(valoriSelectie,numarOptimDreptunghiuri);

% Scalam a.i. aria de sub grafic sa fie 1
numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / (numarValoriSelectie * (centre(2) - centre(1)));

% Calculam densitatea
valoriSelectieNoi = min(valoriSelectie):0.01:max(valoriSelectie);
densitate = n * valoriSelectieNoi .^ (n - 1);

% Metoda I - Histograma
close all
figure
hold on
bar(centre, numarValoriInterval, 1, 'y');
plot(valoriSelectieNoi, densitate);
hold off

% Plotarea densitatii de repartitie pe intervalul [-1 2]
x1 = -1:0.001:0;
f_x1 = x1 * 0;

x2 = 0:0.001:1;
f_x2 = n * x2 .^ (n - 1);

x3 = 1:0.001:2;
f_x3 = x3 * 0;

figure
hold on
plot(x1,f_x1,'r');
hold on
plot(x2,f_x2,'r');
hold on
plot(x3,f_x3,'r');
axis([-2 3 -1 4])
hold off

% Metoda II - Testul X^2
% Determinam probabilitatile
a = centre + (centre(2) - centre(1))/2;
probabilitati = zeros(1,numarOptimDreptunghiuri);
probabilitati(1) = functieRepartitieX(a(1), n);
for i = 2:numarOptimDreptunghiuri - 1
    probabilitati(i) = functieRepartitieX(a(i), n) - functieRepartitieX(a(i-1), n);
end
probabilitati(numarOptimDreptunghiuri) = 1 - functieRepartitieX(a(numarOptimDreptunghiuri-1), n);

% Calculam statistica X^2
X_2 = sum(((numarValoriIntervalNescalate - numarValoriSelectie * probabilitati).^2) ./ (numarValoriSelectie * probabilitati));

% Determinam pragul
alpha = 0.01;
prag = chi2inv(1 - alpha,numarOptimDreptunghiuri - 1);

% Verificam conditia
if X_2 <= prag
    disp('Metoda II - Acceptam ipoteza');
else
    disp('Metoda II - Respingem ipoteza');
end