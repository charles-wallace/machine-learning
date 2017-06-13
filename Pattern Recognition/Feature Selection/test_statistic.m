function ind = test_statistic(features, class_col, class_ids)
[r,c] = size(features);
classes = features(:,class_col);
N1 = 0;
N2 = 0;
xbar = zeros(1,9);
ybar = zeros(1,9);
xfeatures = [];
yfeatures = [];
for i=1:r
    if(classes(i) == class_ids(1))
        N1 = N1 + 1;
        xbar = xbar + features(i, 2:10);
        xfeatures = [xfeatures;features(i, 2:10)];
    end
    if(classes(i) == class_ids(2))
        N2 = N2 + 1;
        ybar = ybar + features(i,2:10);
        yfeatures = [yfeatures;features(i, 2:10)];
    end
end

xbar = (1/N1).*xbar;
ybar = (1/N2).*ybar;
xsum = zeros(1,9);


for j = 1:N1
   xsum = xsum + (xfeatures(j,:)-xbar).^2;
end

ysum = zeros(1,9);
for k = 1:N2
   ysum = xsum + (yfeatures(k,:)-ybar).^2;
end

sz = 1/(N1+N2-2).*(xsum + ysum);

q = [];
for m = 1:(c-2)
 q = [q; (xbar(m) - ybar(m))/(sz(m)*sqrt((1/N1)+(1/N2)))]
end
ind = [];
display('b count: ')
display(N1)
display('m count')
display(N2)
while max(q) ~= -inf
k = max(q);
index = find(q==k);
ind =  [ind;index(1)];
q(ind(length(ind))) = -inf;
end
ind = ind + 1;