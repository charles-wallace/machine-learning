function w=SEP_SVM(X,y)
[l n] = size(X);
y = y';
H = eye(3);
f = zeros(3,1);
A = X';
A = A.*repmat(-y,1,3);
b = -ones(n,1);
w = quadprog(H,f,A,b);
