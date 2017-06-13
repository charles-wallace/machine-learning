function plotteststatfalseneg()
title('False Negative vs # Features for test_statistic');
ylabel('False Negative');
xlabel('# Features');
knnX = [1,2,3,4,5,6,7,8,9];
knnY = [.13, .088, .042, .029, .025, .021, .013, .013, .025];
line(knnX,knnY,'Color','b'); hold on;
svmX = [1,2,3,4,5,6,7,8,9];
svmY = [.347, .092, .079, .042, .050, .046, .033, .033, .038];
line(svmX,svmY,'Color','g'); hold on;
bagX = [1,2,3,4,5,6,7,8,9];
bagY = [.318, .10, .071, .050, .038, .042, .021, .033, .046];
line(bagX,bagY,'Color','r'); hold on;
legend('KNN', 'SVM', 'BAG');