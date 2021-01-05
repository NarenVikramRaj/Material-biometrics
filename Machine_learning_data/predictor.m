clc;
close all;

%ndim = 74;
%ndim = 70;
n = 40; %number of testing points
%n=80;
n1= 5; %number of elements in each class
%n1=10;
ref = zeros(n,1); % true label vectors
b = zeros(n,1);
%datat = zeros(150,n);
%X_test = zeros(39,n/2);
%X = zeros(145,n/2);
%datat = zeros(1000,12);
%X_test = zeros(1000,6);
%Xtest = zeros(6,151);

%%% Exported ML Model Name from  Classifier App
%a = GaussianNaiveBayes;
%a= QuadraticSVM;
%a = WeightedKNN;
%a = SVM;
%a = SubspaceDiscriminant;
%a = BaggedDiscriminant;
%a = SubspaceKNN;
%a = LinearSVM;
%a = MeiumGaussianSVM;
%a = CoarseKNN;
%a = FineTree;
%a = FineTree1;
%a = LinearDiscriminant;
%a = GaussianNaiveBayes;
%a = QuadraticSVM;
%a = FineKNN;
%a = SubspaceDiscriminant1;
a = SubspaceKNN;


%%%import testing data

datat = xlsread('C:\CPMG\TrainingData10p\testdata1.csv');

%coeff = pca(datat);
%data  = datat*coeff;
%d     = array2table(data);

%%%Define Classifier
%y = a.ClassificationDiscriminant;
%y = a.ClassificationNaiveBayes;
%y = a.ClassificationKNN;
%y = a.ClassificationSVM;
y = a.ClassificationEnsemble;
%y = a.ClassificationEnsemble;
%y = a.ClassificationSVM;
%y = a.ClassificationKNN;
%y = a.ClassificationTree;
%yfit = a.predictFcn(data);
[labels,score] = predict(y,datat); % labels is predicted labels
%}

%Define true labels
for i = 1: 8
    
    %ref(n1*(i-1)+1:n1*(i-1)+n1) = [i-1; i-1; i-1;i-1;i-1];
    ref(n1*(i-1)+1:n1*(i-1)+n1) = (i-1)*ones(n1,1);
end

%Compare true labels with prdicted labels and calculate testing accuracy
for j = 1: n
    if ref(j,1) == labels(j,1)
        b(j,1) = 1;
        
    end
    
    
end

numb_1 = sum(b(:) == 1);

test_accuracy = numb_1/n

