function comp_exp_3_2()

N = 200;
m(:,:,1) = [-2,0]';
S(:,:,1) = eye(2);

m(:,:,2) = [2,0]';
S(:,:,2) = eye(2);
P = [.5,.5];


% Generate Data
[X1, y1] = gen_gauss_classes(m, S, P, N, 0);
[r, c] = size(X1);
X1 = [X1 ;ones([1,c])];
Xtest = X1;
ytest = y1;
% Perceptron Algorthm
w = perce(X1,y1,[.1,.1,.1]',.2);
wt= w';
b1 = -1*wt(1)/wt(2);
b0 = -1*wt(3)/w(2);
x = -5:6;
y = b1*x+b0;
figure(1);
figure(1), plot(x,y); hold on;
figure(1), axis([-10 10 -5 5]);

% classify data with perceptron line
y_perceptron = [];
for i=1:c
    if(w'*X1(:,i)>0)
        y_perceptron = [y_perceptron, 1];
    elseif(w'*X1(:,i)<0)
        y_perceptron = [y_perceptron, -1];  
    end    
end

percep_percent_error=compute_error(y1,y_perceptron);


[X1, y1] = gen_gauss_classes(m, S, P, N, 0);
[r, c] = size(X1);
X1 = [X1 ;ones([1,c])];
% Sum of error Squares Classifier
w = SSErr(X1,y1);
wt= w';
b1 = -1*wt(1)/wt(2);
b0 = -1*wt(3)/w(2);
x = -5:6;
y = b1*x+b0;
figure(2), plot(x,y); hold on;
figure(2), axis([-10 10 -5 5]);
y_SSErr = [];
% Classify data with Sum of error Squares Classifier
for i=1:c
    if(w'*X1(:,i)>0)
        y_SSErr = [y_SSErr, 1];
    elseif(w'*X1(:,i)<0)
        y_SSErr = [y_SSErr, -1];
    else
        y_SSErr = [y_SSErr, 1];
    end    
end
SSErr_percent_error=compute_error(y1,y_SSErr);

[X1, y1] = gen_gauss_classes(m, S, P, N, 0);
[r, c] = size(X1);
X1 = [X1 ;ones([1,c])];

%SVM Classifier
w = SVM(X1,y1,15);
wt= w';
b1 = -1*wt(1)/wt(2);
b0 = -1*wt(3)/wt(2);
x = -5:6;

y = b1*x+b0;
ymargin1 = b1*(x+1/(norm(w)))+ b0 + 1;
ymargin2 = b1*(x-1/(norm(w)))+ b0 - 1;

figure(3), plot(x,y); hold on;
figure(3), plot(x,ymargin1); hold on;
figure(3), plot(x,ymargin2); hold on;
figure(3), axis([-10 10 -5 5]);

y_SVM = [];
% Classify data with SVM Classifier
for i=1:c
    if(([w(1) w(2) w(3)]*X1(:,i))>=1)
        y_SVM = [y_SVM, 1];
    elseif(([w(1) w(2) w(3)]*X1(:,i))<= -1)
        y_SVM = [y_SVM, -1];
    elseif(([w(1) w(2) w(3)]*X1(:,i))<0 && ([w(1) w(2) w(3)]*X1(:,i))>-1)
        y_SVM = [y_SVM, -1];
    elseif(([w(1) w(2) w(3)]*X1(:,i))>=0 && ([w(1) w(2) w(3)]*X1(:,i))<1)
        y_SVM = [y_SVM, 1];
    end    
end
SVM_percent_error=compute_error(y1,y_SVM);


desc = sprintf('The Follwing Describes the Classifiers Error on X1:');
perceptron_error =  sprintf('Perceptron Classifier          : %.2f%%', percep_percent_error*100);
SSErr_error =       sprintf('Sum of Square Err. Classifier  : %.2f%%', SSErr_percent_error*100);
SVM_error =         sprintf('SVM Classifier                 : %.2f%%', SVM_percent_error*100);

disp(desc);disp(perceptron_error);disp(SSErr_error);disp(SVM_error);



