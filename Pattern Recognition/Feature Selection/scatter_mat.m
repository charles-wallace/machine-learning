function  [Sw,Sb,Sm]=scatter_mat(X,y)
[l,N] = size(X);
c = max(y);
m=[];
Sw=zeros(l);

for i=1:c
    y_temp=(y==i);
    X_temp=X(:,y_temp);
    P(i)=sum(y_temp)/N;
    m(:,i)=(mean(X_temp'))';
    Sw=Sw+P(i)*cov(X_temp');
end

m0=(sum(((ones(l,1)*P).*m)'))'; 
Sb=zeros(l);

for i=1:c
    Sb=Sb+P(i)*((m(:,i)-m0)*(m(:,i)-m0)');
end
Sm=Sw+Sb;
