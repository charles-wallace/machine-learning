function plotclasssepfalseneg()
title('False Negative vs # Features for Class Sep.');
ylabel('False Negative');
xlabel('# Features');
knnX = [1,2,3,4,5,6,7,8,9];
knnY = [.159,.059,.038,.021,.021,.013,.013, .017, .017];
line(knnX,knnY,'Color','b'); hold on;
svmX = [1,2,3,4,5,6,7,8,9];
svmY = [.163,.071,.059,.050,.042,.038,.038, .029, .046];
line(svmX,svmY,'Color','g'); hold on;
bagX = [1,2,3,4,5,6,7,8,9];
bagY = [.13,.054,.038,.025,.042,.038,.038, .021, .038];
line(bagX,bagY,'Color','r'); hold on;
legend('KNN', 'SVM', 'BAG');