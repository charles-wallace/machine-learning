function comp_exp_4_4(test_input)
m = [-5,5;5,-5; 5,5; -5,-5]';
s=3;
N=100;
rng(0);
[x1 y1] = data_generator(m,s,N);
rng(10);
[x2 y2] = data_generator(m,s,N);
s = 5;
rng(0);
[x3 y3] = data_generator(m,s,N);
rng(10);
[x4 y4] = data_generator(m,s,N);
if(strcmp(test_input,'x1') == 1 || strcmp(test_input,'X1') == 1)
    input = x1;
    target = y1;
    test = x2;
    testtarget = y2;
    xin = 'X1';
    xout = 'X2';
end

if(strcmp(test_input,'x3') == 1 || strcmp(test_input,'X3') == 1)
    input = x3;
    target = y3;
    test = x4;
    testtarget = y4;
    xin = 'X3';
    xout = 'X4';
end

num_nodes = 2;
num_epochs = 300;
train_fun = 'traingda';
mu = .001;
max_xy = max(x1,[],2);
min_xy = min(x1,[],2);

net1 = nn_ex(input, target, num_nodes, mu, num_epochs, train_fun);
% first run
net1 = train(net1, input, target);
% second run
net1 = train(net1, input, target);
%thrid run
%net1 = train(net1, input, target);

h = plot_dec_region(net1,[-5,5;5,-5; 5,5; -5,-5]',[min_xy(1),max_xy(1),min_xy(2),max_xy(2)],.01);
x1_target = round(net1(input));
x2_target = round(net1(test));
x1_class_results = x1_target(1,:);
x1_class = testtarget(1,:);
x2_class_results = x2_target(1,:);
x2_class = testtarget(1,:);
x1_target_error_2 = compute_error(x1_class, x1_class_results);
x2_target_error_2 = compute_error(x2_class, x2_class_results);

title = sprintf('Classifier Errror Comparison:');
nodes2x1 = sprintf('Adaptive Learning Rate Error w/ %s:  %0.2f%%',xin, x1_target_error_2*100);
nodes2x2 = sprintf('Adaptive Learning Rate Error w/ %s:  %0.2f%%',xout, x2_target_error_2*100);
disp(title);
disp(nodes2x1);disp(nodes2x2);