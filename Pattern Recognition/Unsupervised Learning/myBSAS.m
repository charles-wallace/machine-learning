function cluster_id = myBSAS( X, theta, q )
% MYBSAS implements the BSAS clustering algorithm
%   cluster_id = MYBSAS( X, theta, q )
N = size(X,1);              % Number patterns
order = randperm(N);        % Create a random ordering of X
X = X(order,:);
cluster_id = zeros(N,1);    % Array of cluster IDs

% Initialization
m = 1;                      % Number of clusters
cluster_id(1)=1;            % Cluster of 1st element
cluster{m} = [];
cluster{m} = [cluster{m}; X(1,:)];


for i=2:N
    % Get the distance to and ID of the nearest cluster
    %[dmin,id] = minclustdist(X(i,:),X,cluster_id);
    [ dmin, id ] = min_d(X(i,:), cluster);
    % If its too big, form a new cluster with it if we can

    if dmin>theta && m<q
        cluster_id(i) = m+1;
        m = m+1;
        cluster{m} = [];
        cluster{m} = [cluster{m};X(i,:)];
    % Otherwise add it to the nearest cluster
    else
        % Ck = Ck union {xi}
        cluster{id} = [cluster{id};X(i,:)];
        cluster_id(i) = id;
    end
end
