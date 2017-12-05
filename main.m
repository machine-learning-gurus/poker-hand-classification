clear all; close all;

data = dlmread("data/poker-hand-training-true.data",",");
y = data(:,end);
X = data(:,1:end-1);

test_data = dlmread("data/poker-hand-testing.data",",");
y_test = test_data(:,end);
X_test = test_data(:,1:end-1);

% LDA
tic;
timerVal = tic;
lda(X, y, X_test, y_test);
toc;

data = dlmread("data/wine.data",",");
y = data(:,1);
X = data(:,2:end);
y_test = data(:,1);
X_test = data(:,2:end);

% Wine LDA
tic;
timerVal = tic;
lda_wine(X, y, X_test, y_test);
toc;

% tic;
% timerVal = tic;
% qda(X, y, X_test, y_test);
% toc;

% plotGaussian(X, y;
plotWine(X, y);
