numere_aleatoare = rand(1,1000);

numar_dreptunghiuri = 10;
[numere_din_interval, centrele] = hist(numere_aleatoare,numar_dreptunghiuri);

bar(centrele, numere_din_interval, 1, 'b');

% Numere din intervalul (a,b)

A = 5;
B = 10;

numere_interval = (B-A) .* numere_aleatoare + A;

min(numere_interval)
max(numere_interval)