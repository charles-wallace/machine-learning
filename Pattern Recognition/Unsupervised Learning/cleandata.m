function bcw = cleandata(fname)
fileid = fopen(fname);
data = textscan(fileid,'%f%f%f%f%f%f%f%f%f%f%f','Delimiter',',','EmptyValue',-inf);
fclose(fileid);
features = [];
for i = 2:11
    features = [features , data{i}];
end
[r c] = size(features)
mu = zeros(1,c-1);
for i = 1:(c-1) 
    for j = 1:r
        if(features(j,i) ~= -inf)
            mu(i) = mu(i) + features(j,i);
        end
    end
end
mu = mu./r;

for i = 1:(c-1) 
    for j = 1:r
        if(features(j,i) == -inf)
            features(j,i) = mu(i);
        end
    end
end

bcw = features;