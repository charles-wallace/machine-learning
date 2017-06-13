function plotpcaerror()
title('Error Rate vs # Features for PCA.');
ylabel('Error Rate');
xlabel('# Features');
knnX = [1,2,3,4,5,6,7,8,9];
knnY = [.028, .028, .031, .031, .032, .041, .041, .047, .045];
line(knnX,knnY,'Color','b'); hold on;
svmX = [1,2,3,4,5,6,7,8,9];
svmY = [.028, .034, .029, .031, .032, .035, .029, .031, .035];
line(svmX,svmY,'Color','g'); hold on;
bagX = [1,2,3,4,5,6,7,8,9];
bagY = [.041, .048, .038, .029, .031, .025, .026, .029, .026];
line(bagX,bagY,'Color','r'); hold on;
legend('KNN', 'SVM', 'BAG');