function net = nn_ex(inputs, targets, num_nodes, mu, num_epochs, train_fun)

if strcmp(train_fun,'traingd') == 1
    net = patternnet(num_nodes);
    net.trainFcn = train_fun;
    net.trainParam.lr = mu;
    net.trainParam.epochs = num_epochs;
    %net.trainParam.showWindow = false;
end
    
if strcmp(train_fun,'traingda') == 1
    net = feedforwardnet(4,'traingda');
    net.trainParam.lr = 0.05;
    net.trainParam.lr_inc = 1.05;
    net.trainParam.lr_dec = .7;
    net.trainParam.max_perf_inc = 1.04;
    net.trainParam.epochs = num_epochs;    
end
net.divideParam.trainRatio = 75/100;
net.divideParam.valRatio = 25/100;
net.divideParam.testRatio = 0/100;

