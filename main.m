clear all; close all;

data = dlmread("data/poker-hand-training-true.data",",");
y = data(:,end);
X = data(:,1:end-1);

test_data = dlmread("data/poker-hand-testing.data",",");
y_test = test_data(:,end);
X_test = test_data(:,1:end-1);

% LDA
lda(X, y, X_test, y_test);
