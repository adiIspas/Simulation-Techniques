% Curatam spatiul de lucru
clear
clc

% Setam parametrii
alpha = determina_alpha();
numarValoriSelectie = 1000;

% Determinam valorile de selectie
valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simulareVariabilaX(alpha);
end

% Scalam a.i. aria de sub grafic sa fie 1.
numarOptimDreptunghiuri = floor(1 + log2(numarValoriSelectie));
[numarValoriInterval, centre] = hist(valoriSelectie,numarOptimDreptunghiuri);

numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / (numarValoriSelectie * (centre(2) - centre(1)));

valoriSelectieNoi = min(valoriSelectie):0.01:max(valoriSelectie);
densitateX = valoriSelectieNoi.^2 + 4/3 * valoriSelectieNoi;

% Metoda I - Histograma
close all;
hold on
bar(centre,numarValoriInterval,1,'g');
plot(valoriSelectieNoi,densitateX);
hold off

% Metoda III - Testul X^2
a = centre + (centre(2) - centre(1))/2;
probabilitati = zeros(1,numarOptimDreptunghiuri);

% Determinam probabilitatile
probabilitati(1) = functiaRepartitieX(a(1));
for i = 2:numarOptimDreptunghiuri
    probabilitati(i) = functiaRepartitieX(a(i)) - functiaRepartitieX(a(i-1));
end
probabilitati(numarOptimDreptunghiuri) = 1 - functiaRepartitieX(a(numarOptimDreptunghiuri - 1));

% Determinam pragul
alpha = 0.01;
prag = chi2inv(1 - alpha, numarOptimDreptunghiuri - 1);

% Calculam statistica
X_2 = sum(((numarValoriIntervalNescalate - numarValoriSelectie * probabilitati).^2)./(numarValoriSelectie * probabilitati));

% Testam ipoteza
if X_2 <= prag
    disp('Metoda III - Acceptam ipoteza nula');
else
    disp('Metoda III - Respingem ipoteza nula');
end

% Reprezentam curba densitatii pe [-2,2]
% x pe intervalul [-2 0)
x_1 = -2:0.001:0;
f_x1 = x_1*0;

% x pe intervalul [0 1]
x_2 = 0:0.001:1;
f_x2 = x_2.^2 + 4/3 * x_2;

% x pe intervalul (1 2]
x_3 = 1:0.001:2;
f_x3 = x_2*0;

figure
plot(x_1,f_x1,'r')
hold on
plot(x_2,f_x2,'r')
hold on
plot(x_3,f_x3,'r')
axis([-3 3 -3 3])
hold off
