function [dmin, id] = min_d(x_i, Cj)
[r c] = size(Cj);
dist = [];
for i = 1:c
    distance = norm(mean(Cj{i}) - x_i);
    dist = [dist, distance];
    if min(dist) == distance
        dmin = distance;
        id = i;
    end
end    