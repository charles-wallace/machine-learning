function plotclasssep()
title('Error Rate vs # Features for Class Sep.');
ylabel('Error Rate');
xlabel('# Features');
knnX = [1,2,3,4,5,6,7,8,9];
knnY = [.088, .038, .034, .029, .031, .025, .025, .028, .028];
line(knnX,knnY,'Color','b'); hold on;
svmX = [1,2,3,4,5,6,7,8,9];
svmY = [.091, .042, .037, .037, .029, .026, .028, .029, .035];
line(svmX,svmY,'Color','g'); hold on;
bagX = [1,2,3,4,5,6,7,8,9];
bagY = [.091, .042, .029, .031, .040, .031, .034, .028, .032];
line(bagX,bagY,'Color','r'); hold on;
legend('KNN', 'SVM', 'BAG');