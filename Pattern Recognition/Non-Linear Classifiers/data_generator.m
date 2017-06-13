function [x,y]=data_generator(m,s,N) 
S = s*eye(2);
[l,c] = size(m);
x = []; % Creating the training set 
for i = 1:c
    x = [x mvnrnd(m(:,i)',S,N)']; 
end
y=[[ones(1,N); zeros(1,N)],[ones(1,N); zeros(1,N)], [zeros(1,N); ones(1,N)], [zeros(1,N); ones(1,N)]];