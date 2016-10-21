% Exercitiul 1
n = 50; % numarul de pacienti
p = 0.2; % probabilitatea de vindecare

Y_cdf_1 = binocdf(3,n,p); % probabilitatea ca cel mult 3 pacienti sa se vindece prin cdf
Y_pdf_1 = sum(binopdf(0:3,n,p)); % probabilitatea ca cel mult 3 pacienti sa se vindece prin pdf

% Exercitiul 2
lambda = 0.25; 
Y_cdf_2 = 1 - poisscdf(1,lambda); % Probabilitatea ca o pagina sa aiba cel putin 2 erori
Y_pdf_2 = 1 - sum(poisspdf(0:1,lambda));

% Exercitiul 3
x = -10:0.1:10;
X_1 = normpdf(x,-2,2);
X_2 = normpdf(x,0,1);
X_3 = normpdf(x,2,0.5);

plot(X_1);
hold on;
plot(X_2);
plot(X_3);
hold off;

% Exercitiul 4
Y_1 = normspec([-2,2]);
Y_2 = normspec([-3,3]);
Y_3 = normspec([-4,4]);

% Exercitiul 5
z = 15;
mu = 20;
Z_1 = 1 - expcdf(20,15); % Probabilitatea ca un cetatean sa astepte 20 de minute
