function [] = aplicatie_1()
A = [1 2 3; 4 5 6; 7 8 9];

%a
M = [A(1,1) A(1,3); A(3,1) A(3,3)]
A(2:3,2:3)

%b
A(:,2)
A(3,:)

%c
index = find(mod(A,2)==0);
A(index) = 0;

%d
A = [A; 10 11 12]
A = [A [4; 7; 10; 13]]
end
