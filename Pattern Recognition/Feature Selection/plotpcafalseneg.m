function plotpcafalseneg()
title('Error Rate vs # Features for PCA.');
ylabel('Error Rate');
xlabel('# Features');
knnX = [1,2,3,4,5,6,7,8,9];
knnY = [.021, .017, .008, .013, .025, .046, .059, .075, .071];
line(knnX,knnY,'Color','b'); hold on;
svmX = [1,2,3,4,5,6,7,8,9];
svmY = [.025, .038, .033, .038, .042, .054, .038, .046, .054];
line(svmX,svmY,'Color','g'); hold on;
bagX = [1,2,3,4,5,6,7,8,9];
bagY = [.046, .059, .038, .013, .017, .008, .013, .021, .017];
line(bagX,bagY,'Color','r'); hold on;
legend('KNN', 'SVM', 'BAG');