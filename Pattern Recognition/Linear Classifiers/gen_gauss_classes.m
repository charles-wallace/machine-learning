function [X, y]=gen_gauss_classes(m, S, P, N, seed)
[row,column,class] = size(m);

% matrix to hold data
X = [];
% vector to hold class number for respective data points
y = [];
figure();
for j=1:class
    % generates class data points
t = gen_gauss_data(m(:,:,j),S(:,:,j),fix(P(j)*N), seed);
    if(j == 2)
        k=-1;
    elseif (j == 1)
        k = 1;
    end
y=[y ones(1,fix(P(j)*N))*k];
X=[X t];
Dataplot = t;
plot(Dataplot(1,:),Dataplot(2,:),'o'); hold on;
end
