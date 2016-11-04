% Pregatire
% x = rand(1,1000);
% [n,x] = hist(x,15);
% bar(x,n,1,'w')
% title('Histograma asociata unei variabile aleatoare uniforme');
% xlabel('X');
% ylabel('Y');

% Partea I
% Exercitiul 2
% A = my_rand(-2,2,1,1000);
% 
% % Exercitiul 3
% [n,x] = hist(A,15);
% bar(x,n,1,'b');
% 
% % Exercitul 4
% v = [];
% for i=-2:0.1:1.9
%     v = [v sum(unifcdf(A,i,i+0.1))/length(A)];
% end
% 
% plot(v);

% Partea II
% Exercitiul 1
% lambda = 1;
% n = 1000;
% U = ex_1a(lambda, n);
% [N,X] = hist(U);
% for i = 1:length(N)-1
%     N(i) = N(i)/(length(N) * (X(i+1)-X(i)));
% end
% 
% sizee = size(N);
% hold on
% bar(X,N,1,'b');
% plot(1:10,N);
% hold off;

% f(x) ~ fi/n*l; l = ai - ai-1 (lungimea intervalului) n = numarul de
% valori din intervalul ala ...






% Exercitiul 2
lambda = 5;
n = 1000;
U = ex_2a(lambda, n);
k = 1 + log2(n);
[N,X] = hist(U);
N = N/(length(U) *  (X(2) - X(1)));

hold on
bar(X,N,1,'w');

v = min(U):0.1:max(U);
densitate = lambda * power(v,-lambda-1); 
plot(v,densitate);
hold off;



