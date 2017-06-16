import csv
# library for Numpy
import numpy as NP
# library for plotting
import matplotlib.pyplot as plt
# library for KNeighborsClassifier
from sklearn.neighbors import KNeighborsClassifier as KNN
# library for SVM
from sklearn.svm import SVC
# library for Random Forest
from sklearn.ensemble import RandomForestClassifier as RF
# library for adaBoost
from sklearn.ensemble import AdaBoostClassifier as ADA
# library for standardizing dataset
from sklearn.preprocessing import StandardScaler
# library for confusion matrix
from sklearn.metrics import confusion_matrix

# Class for data
class Data(object):
    def __init__(self, include_ground_truth):
        self.train_data = NP.genfromtxt('user_action_info_train_label.csv', delimiter=',', skip_header=1)
        self.test_data = NP.genfromtxt('user_action_info_test_label.csv', delimiter=',', skip_header=1)
        [self.train_row, self.train_col] = self.train_data.shape
        [self.test_row, self.test_col] = self.test_data.shape
        self.train_X = self.train_data[0:self.train_row+1,2:(self.train_col-1)]
        self.train_y = self.train_data[0:(self.train_row+1), (self.train_col-1)]
        self.test_X = self.test_data[0:self.test_row+1,2:(self.test_col)]
        self.labels = self.test_data[0:self.test_row+1,0:3]
        if include_ground_truth == 1:
            self.ground_truth = NP.genfromtxt('ground_truth.csv', delimiter=',', skip_header=1)
            [self.truth_row, self.truth_col] = self.ground_truth.shape
            self.truth_y = self.ground_truth[0:self.truth_row+1, 2]


    def Class_KNN(self, num_neighbors):
        print "Initializing KNN Test"
        K = KNN(n_neighbors = num_neighbors)
        print "Fitting with KNN"
        K.fit(self.train_X, self.train_y)
        print "Predicting Accuracy of KNN"
        K.predict(self.train_X)
        accuracy = K.score(self.train_X, self.train_y)
        print "KNN Score: ",
        print accuracy
        print "Predicting Test Set with KNN"
        prediction = K.predict_proba(self.test_X)
        print "Returning KNN Classification"
        return prediction[:,1]

    def Class_SVM(self,confuse):
        print "Initializing SVM Test"
        svm = SVC(probability=True)
        print "Fitting with SVM"
        svm.fit(self.train_X, self.train_y)
        print "Predicting Accuracy of SVM"
        train_result = svm.predict(self.train_X)
        accuracy = svm.score(self.train_X, self.train_y)
        if confuse == 1:
            print "SVM Confusion Matrix"
            print confusion_matrix(self.train_y, train_result)
        print "SVM Score: ",
        print accuracy
        print "Predicting Test Set with SVM"
        prediction = svm.predict_proba(self.test_X)
        print "Returning SVM Classification"
        return prediction[:,1]
    
    def Class_RF(self, num_estimators,confuse):
        print "Initializing Random Forest Test"
        rf = RF(n_estimators = num_estimators)
        print "Fitting with Random Forest"
        rf.fit(self.train_X, self.train_y)
        print "Predicting Accuracy of Random Forest"
        train_result = rf.predict(self.train_X)
        if confuse == 1:
            print "Random Forest Confusion Matrix"
            cm = confusion_matrix(self.train_y, train_result)
            print cm
            plt.matshow(cm)
            plt.title('Random Forest Confusion Matrix')
            plt.colorbar()
            plt.show()
        accuracy = rf.score(self.train_X, self.train_y)
        print "Random Forest Score: ",
        print accuracy
        print "Predicting Test Set with Random Forest"
        prediction = rf.predict_proba(self.test_X)
        print "Returning Random Forest Classification"
        return prediction[:,1]

    def Class_ADA(self, confuse):
        print "Initializing AdaBoost Test"
        ada = ADA()
        print "Fitting with AdaBoost"
        ada.fit(self.train_X, self.train_y)
        print "Predicting AdaBoost"
        train_result = ada.predict(self.train_X)
        if confuse == 1:
            print "Random Forest Confusion Matrix"
            cm = confusion_matrix(self.train_y, train_result)
            print cm
            plt.matshow(cm)
            plt.title('Random Forest Confusion Matrix')
            plt.colorbar()
            plt.show()
        accuracy = ada.score(self.train_X, self.train_y)
        print "Random Forest Score: ",
        print accuracy
        print "Predicting Test Set with Random Forest"
        prediction = ada.predict_proba(self.test_X)
        print "Returning Random Forest Classification"
        return prediction[:,1]

    def test_KNN_Acc(self, n_start, n_stop):
        for n_start in xrange(n_start, n_stop):
            K = KNN(n_neighbors = n_start)
            K.fit(self.train_X, self.train_y)
            K.predict(self.train_X)
            accuracy = K.score(self.train_X, self.train_y)
            print "K = ",
            print n_start
            print accuracy

    def test_RF_Acc(self, n_start, n_stop):
        for n_start in xrange(n_start, n_stop):
            rf = RF(n_estimators = n_start)
            rf.fit(self.train_X, self.train_y)
            rf.predict(self.train_X)
            accuracy = rf.score(self.train_X, self.train_y)
            print "n_estimators = ",
            print n_start
            print accuracy
        
    def Standardize(self):
        print "Standardizing"
        scaler = StandardScaler()
        self.test_X = scaler.fit_transform(self.test_X)
        self.train_X = scaler.fit_transform(self.train_X)

    def printToFile(self,results, writename):
        print "Writing Results To File"
        resultFile = open(writename, 'w')
        resultFile.write("user_id#merchant_id,prob\n")
        for row in xrange(0,self.test_row):
            label = str(int(self.labels[row,0])) + '#' + str(int(self.labels[row,1])) + ','+ str(results[row]) + "\n"
            resultFile.write(label)
        resultFile.close()

    def testSVCGroundTruth(self):
        print "Initializing SVM Test"
        svm = SVC(verbose=True)
        print "Fitting with SVM"
        svm.fit(self.train_X, self.train_y)
        print "Predicting Accuracy of SVM"
        train_result = svm.predict(self.train_X)
        accuracy = svm.score(self.test_X, self.truth_y)
        print "Accuracy Against Ground Truth: ",
        print accuracy
        
if __name__ == '__main__':
    print "Getting Data"


#########################
#        KNN Test       # 
#########################
#    KNN_Test = Data()
#    KNN_Test.Standardize()
#    results = KNN_Test.Class_KNN(4)
#    KNN_Test.printToFile(results, "KNN_Submission.csv")


#########################
#  Random Forest Test   # 
#########################
#    RF_Test = Data(0)                                                                                                              
#    RF_Test.Standardize()
#    results = RF_Test.Class_RF(4000,1)
#    RF_Test.printToFile(results, "RF_Submission.csv")


#########################
#       SVC Test        # 
#########################
#    SVM_Test = Data(0)
#    SVM_Test.Standardize()
#    results = SVM_Test.Class_SVM(1)
#    SVM_Test.printToFile(results, "SVM_Test.csv")


#########################
#       Ada Test        # 
#########################
#    ADA_Test = Data(0)
#    ADA_Test.Standardize()
#    results = ADA_Test.Class_ADA(1)
#    ADA_Test.printToFile(results, "ADA_Test.csv")

############################################################
#       Testing Results of SVC Against Ground Truth        # 
############################################################
    SVC_Truth = Data(1)
    SVC_Truth.Standardize()
    SVC_Truth.testSVCGroundTruth()
