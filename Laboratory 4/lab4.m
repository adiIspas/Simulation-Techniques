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
lambda = 1;
n = 1000;
U = ex_1a(lambda, n);
[N,X] = hist(U);
for i = 1:length(N)-1
    N(i) = N(i)/length(N) * 1/(X(i+1)-X(i));
end
bar(X,N,1,'w');





