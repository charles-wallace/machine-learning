function w=SVM(X,y,C)
if(C ~= 0)
[l,n] = size(X);
X = X';
X(:,3) = [];
H = zeros(n+3);
H(1:2,1:2) = eye(2);
f = (1/C)*ones(n+3,1);
f(1:3) = 0;
%constraints are yi(w'x+w0)>=1-eta_i -> -yi(w'x+w0)-eta_i<=-1 -> Ax<=b
A = zeros(2*n,n+3);
A(1:n,1:2) = X;
A(1:n,3) = 1;
A(1:n,1:3) = A(1:n,1:3).*repmat(-y',1,3); % -yi(w'x+w0)
A(1:n,4:end) = -eye(n);
A(n+1:end,4:end) = -eye(n); % -eta_i <= 0
b = -ones(2*n, 1); % *<=-1
b(n+1:end) = 0; % -eta_i <=0
w = quadprog(H,f,A,b);
else
w=SEP_SVM(X,y);    
end
 