function w=SSErr(X,y) 
w=pinv(X*X')*(X*y');