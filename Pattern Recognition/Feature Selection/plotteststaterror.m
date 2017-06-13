function plotteststaterror()
title('Error Rate vs # Features for test_statistic');
ylabel('Error Rate');
xlabel('# Features');
knnX = [1,2,3,4,5,6,7,8,9];
knnY = [.196, .061, .047, .040, .029, .031, .026, .028, .032];
line(knnX,knnY,'Color','b'); hold on;
svmX = [1,2,3,4,5,6,7,8,9];
svmY = [.148, .048, .054, .034, .035, .035, .031, .029, .029];
line(svmX,svmY,'Color','g'); hold on;
bagX = [1,2,3,4,5,6,7,8,9];
bagY = [.141, .064, .056, .042, .037, .038, .026, .037, .034];
line(bagX,bagY,'Color','r'); hold on;
legend('KNN', 'SVM', 'BAG');