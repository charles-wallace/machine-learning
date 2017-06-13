function [ccount, theta] = bsasclusters(X,tmin,tmax,dt,s)
% BSASCLUSTERS estimates the number of clusters for a range of theta values
%
%   [ccount, theta] = BSASCLUSTERS(X,tmin,tmax,dt,s)

theta = tmin:dt:tmax;           % Range of theta values
ccount = zeros(size(theta));    % Cluster count vs. theta
clusters = zeros(s,1);          % Holds the cluster counts for each theta

for i=1:length(theta)
    % Run BSAS s tunes
    for j=1:s
         cluster_ids = myBSAS(X, theta(i), 10);
         clusters(j) = max(cluster_ids);
    end
    % Pick the most common value as representative
    ccount(i) = mode(clusters);
end

%myfig('~axis');
plot(theta,ccount,'linewidth',2);
% The prediction is the most common value over the range of thetas
title([num2str(mode(ccount)),' Clusters Detected'], 'fontsize', 18);
xlabel('\Theta', 'fontsize', 16);
ylabel('Clusters', 'fontsize', 16);

