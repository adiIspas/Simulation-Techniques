% Curatam spatiul de lucru
clear
clc

% Setam parametrii
numarValoriSelectie = 1000;
alpha = determinaAlpha();

% Generam valori de selectie
valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simuleazaVariabilaX(alpha);
end

% Determinam numarul optim de dreptunghiuri
numarOptimDreptunghiuri = floor(1 + log2(numarValoriSelectie));
[numarValoriInterval, centre] = hist(valoriSelectie, numarOptimDreptunghiuri);

% Scalam a.i. aria de sub grafic sa fie 1
numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / (numarValoriSelectie * (centre(2) - centre(1)));

% Determinam densitatea
valoriSelectieNoi = min(valoriSelectie):0.01:max(valoriSelectie);
densitate = 3/2 * valoriSelectieNoi .^ 2 + valoriSelectieNoi;

% Verificare cu metoda Histogramei
close all
figure
hold on
bar(centre,numarValoriInterval,1,'y');
plot(valoriSelectieNoi,densitate);
hold off

% Reprezentarea curbiei densitatii pe intervalul [-2 2]
x1 = -2:0.01:0;
f_x1 = x1 .* 0;

x2 = 0:0.01:1;
f_x2 = 3/2 * x2 .^ 2 + x2;

x3 = 1:0.01:2;
f_x3 = x3 .* 0;

figure
hold on
plot(x1,f_x1,'r');
hold on
plot(x2,f_x2,'r');
hold on
plot(x3,f_x3,'r');
axis([-3 3 -1 3]);
hold off

% Verificam cu metoda testului X^2
a = centre + (centre(2) - centre(1))/2;
probabilitati = zeros(1,numarOptimDreptunghiuri);

% Determinam probabilitatile
probabilitati(1) = functieRepartitieX(a(1));
for i = 2:numarOptimDreptunghiuri - 1
    probabilitati(i) = functieRepartitieX(a(i)) - functieRepartitieX(a(i-1));
end
probabilitati(numarOptimDreptunghiuri) = 1 - functieRepartitieX(a(numarOptimDreptunghiuri-1));

% Calculam statistica X^2
X_2 = sum(((numarValoriIntervalNescalate - numarValoriSelectie*probabilitati).^2) ./ (numarValoriSelectie * probabilitati));

% Determinam pragul
alpha_prag = 0.01;
prag = chi2inv(1 - alpha_prag,numarOptimDreptunghiuri - 1);

if X_2 <= prag
    disp('Aceptam ipoteza');
else
    disp('Respingem ipoteza');
end
