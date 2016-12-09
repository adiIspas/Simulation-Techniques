function adrian_ispas_343()
% Curatam spatiul de lucru
clear
clc

% Setam parametrii
numarValoriSelectie  = 1000;
%1 - exp(1 - x)

% Generam valori de selectie
valoriSelectie = zeros(1,numarValoriSelectie);
for i = 1:numarValoriSelectie
    valoriSelectie(i) = simuleazaVariabilaX();
end

% Determinam numarul optim de dreptunghiuri
numarOptimDreptunghiuri = floor(1 + log2(numarValoriSelectie));
[numarValoriInterval, centre] = hist(valoriSelectie,numarOptimDreptunghiuri);

% Scalam a.i. aria de sub grafic sa fie 1
numarValoriIntervalNescalate = numarValoriInterval;
numarValoriInterval = numarValoriInterval / (numarValoriSelectie * (centre(2) - centre(1)));

% Determinam densitatea pe intervalul [0,5]
p1 = valoriSelectie(valoriSelectie>=0 & valoriSelectie<=1);
x11 = min(p1):0.01:max(p1);
f_x1 = x11.^2;

p2 = valoriSelectie(valoriSelectie>1&valoriSelectie<=5);
x22 = min(p2):0.01:max(p2);
f_x2 = 2/3 * exp(-x22+1);

% Reprezentam histograma
close all
hold on
bar(centre,numarValoriInterval,1,'y');
hold on
plot(x11,f_x1,'r');
hold on
plot(x22,f_x2,'r');
hold off

% Testul X^2
a = centre + (centre(2) - centre(1))/2;

% Construim vectorul p = [p1, p2, ..., pk]
proabilitati = zeros(1, numarOptimDreptunghiuri);
proabilitati(1) = functieRepartitieX(a(1));
for i = 2 : numarOptimDreptunghiuri - 1
    proabilitati(i) = functieRepartitieX(a(i)) - functieRepartitieX(a(i-1));
end
proabilitati(numarOptimDreptunghiuri) = 1 - functieRepartitieX(a(numarOptimDreptunghiuri-1));

% Calculam statistica X^2
X_2 = sum(((numarValoriIntervalNescalate - numarValoriSelectie * proabilitati) .^ 2) ./ (numarValoriSelectie * proabilitati));

% cuantila superioara de ordin 1 - alpha a variabilei chi2 (hi patrat), 
% notata 'prag', unde alpha este o valoare mica
% k - 1 reprezinta numarul gradelor de libertate
alpha = 0.01;
prag = chi2inv(1 - alpha, numarOptimDreptunghiuri - 1);

% Testul X^2
if X_2 <= prag
    disp('Acceptam ipoteza nula: X are functia de repartitie F(x)')
else
    disp('Respingem ipoteza nula')
end

% Simularea variabilei X
function [ rezultat ] = simuleazaVariabilaX()
    u = rand();
    
    if u <= 1/3
        uniforme = rand(1,3);
        rezultat = max(uniforme);
    else
        rezultat = 1 + exprnd(1);
    end
end

% Functia de repartitie
function [ rezultat ] = functieRepartitieX( x )
    if x < 0
        rezultat = 0;
    elseif x >= 0 && x <= 1
        rezultat = x^3/3;
    else
        rezultat = 2/3 * (-exp(1-x));
    end
end

end