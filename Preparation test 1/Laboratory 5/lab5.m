% Curatam spatiul de lucru
clear;
clc;

% Setam parametrii
numarValoriVariabilaAleatoare = 10;
X = 0:numarValoriVariabilaAleatoare;
probabilitate = 0.5;
p = binopdf(X,numarValoriVariabilaAleatoare,probabilitate);
numarValoriSelectie = 1000;

% Determinam o multime de valori de selectie
valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simulareVariabilaDiscreta(X,p);
end

% Determinam centrele
centre = 0:numarValoriVariabilaAleatoare;
numarValoriInterval = zeros(size(centre));

% Determinam numarul de valori din intervale
for i = 1:numarValoriVariabilaAleatoare
    numarValoriInterval(i) = sum(valoriSelectie == i - 1);
end

% Scalam dreaptunghiurile a.i. aria sa fie 1.
numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / numarValoriSelectie;

% Metoda I - Histograma
close all
hold on
title('Simulare variabila discreta');
bar(centre,numarValoriInterval,1,'w');
plot(centre,p);
hold off

% Metoda II - momentele de selectie
% Determinam media si dispersia teoretica
mediaTeoretica = sum(X .* p);
dispersiaTeoretica = sum(((X - mediaTeoretica).^2) .* p);

% Determinam media si dispersia estimata
mediaEstimata = mean(valoriSelectie);
dispersiaEstimata = var(valoriSelectie);

% Calculam eroarea
eroareMedie = abs(mediaTeoretica-mediaEstimata);
eroareDispersie = abs(dispersiaTeoretica-dispersiaEstimata);

if eroareMedie <= 0.2 && eroareDispersie <= 0.2
    disp('Metoda II - Simulare buna');
else
    disp('Metoda II - Simulare eronata');
end

% Metoda III - Testul X^2
a = centre + (centre(2) - centre(1))/2;
probabilitati = zeros(1,numarValoriVariabilaAleatoare+1);

probabilitati(1) = binocdf(a(1),numarValoriVariabilaAleatoare,probabilitate);
for i = 2:numarValoriVariabilaAleatoare-1
    probabilitati(i) = binocdf(a(i),numarValoriVariabilaAleatoare,probabilitate) - binocdf(a(i-1),numarValoriVariabilaAleatoare,probabilitate);
end
probabilitati(numarValoriVariabilaAleatoare) = 1 - binocdf(a(numarValoriVariabilaAleatoare-1),numarValoriVariabilaAleatoare,probabilitate);

% Calculam statistica X^2
X_2 = sum(((numarValoriIntervalNescalate - numarValoriSelectie * probabilitati).^2) / (numarValoriSelectie * probabilitati));

% Determinam pragul
alpha = 0.01;
prag = chi2inv(1-alpha,numarValoriVariabilaAleatoare - 1);

% Testam ipoteza
if X_2 <= prag
    disp('Metoda III - Acceptam ipoteza nula')
else
    disp('Metoda III - Respingem ipoteza nula')
end