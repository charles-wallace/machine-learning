function  comp_exp_4_1()
m = [-5,5;5,-5; 5,5; -5,-5]';
s=3;
N=100;
rng(0);
classstring{1} = ['Data Set: ' num2str(1)];
[x1 y1] = data_generator(m,s,N);
rng(10);
classstring{2} = ['Data Set: ' num2str(2)];
[x2 y2] = data_generator(m,s,N);
s = 5;
rng(0);
classstring{3} = ['Data Set: ' num2str(3)];
[x3 y3] = data_generator(m,s,N);
rng(10);
classstring{4} = ['Data Set: ' num2str(4)];
[x4 y4] = data_generator(m,s,N);
figure();
plot(x1(1,:),x1(2,:),'o'); hold on;
plot(x2(1,:),x2(2,:),'o'); hold on;
plot(x3(1,:),x3(2,:),'o'); hold on;
plot(x4(1,:),x4(2,:),'o'); hold on;

title('Plot of X1 X2 X3 X4');
legend(classstring);