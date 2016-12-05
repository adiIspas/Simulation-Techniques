% Curatam spatiul de lucru
clear;
clc;

% Setam parametrii
lambda = 1;
numarValoriSelectie = 1000;

valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simulareExponentiala(lambda);
end

% Determinam numarul optim de dreptunghiuri pentru histograma
numarOptimDreptunghiuri = floor(1 + log2(numarValoriSelectie));
[numarValoriInterval, centre] = hist(valoriSelectie,numarOptimDreptunghiuri);

% Scalam aria dreptunghiurilor astfel incat sa fie 1.
numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / (numarValoriSelectie * (centre(2) - centre(1)));

% Calculam densitatea functiei exponentiale
e = exp(1);

% Generam valorile de selectie dintre minim si maxim cu un pas de 0.01
valoriSelectieNoi = min(valoriSelectie):0.01:max(valoriSelectie);
densitateExponentiala = lambda * e.^(-lambda .* valoriSelectieNoi);

% Metoda I - Histograma
% Plotam rezultatele.
close all;
hold on
title('Simularea variabilei exponentiale');
bar(centre, numarValoriInterval, 1, 'w');
plot(valoriSelectieNoi,densitateExponentiala);
hold off

% Metoda II - Momentele de selectie
mediaTeoreticaExponentiala = 1/lambda;
dispersiaTeoreticaExponentiala = 1/(lambda^2);

mediaEstimataExponentiala = mean(valoriSelectie);
dispersiaEstimataExponentiala = var(valoriSelectie);

eroareMedie = abs(mediaEstimataExponentiala - mediaTeoreticaExponentiala);
eroareaDispersie = abs(dispersiaEstimataExponentiala - dispersiaTeoreticaExponentiala);

if eroareMedie <= 0.2 && eroareaDispersie <= 0.2
    disp('Metoda II - Simulare buna');
else
    disp('Metoda II - Simulare eronata');
end

% Metoda III - Testul X^2
% Deplasam centrele
a = centre + (centre(2) - centre(1))/2;
probabilitati = zeros(1,numarOptimDreptunghiuri);

% Calculam probabilitatile
probabilitati(1) = functieRepartitieExponentiala(a(1),lambda);
for i = 2:numarOptimDreptunghiuri - 1
    probabilitati(i) = functieRepartitieExponentiala(a(i),lambda) - functieRepartitieExponentiala(a(i-1),lambda);
end
probabilitati(numarOptimDreptunghiuri) = 1 - functieRepartitieExponentiala(a(numarOptimDreptunghiuri - 1), lambda);

% Calculam statistica X^2

X_2 = sum(((numarValoriIntervalNescalate - numarValoriSelectie * probabilitati).^2)./(numarValoriSelectie * probabilitati));

% Determinam pragul
alpha = 0.01;
prag = chi2inv(1-alpha,numarOptimDreptunghiuri - 1);

% Testam ipoteza
if X_2 <= prag
    disp('Metoda III - Acceptam ipoteza nula')
else
    disp('Metoda III - Respingem ipoteza nula')
end


