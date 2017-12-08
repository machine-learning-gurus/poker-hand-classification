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
y_wine = data(:,1);
X_wine = data(:,2:end);
y_test_wine = data(:,1);
X_test_wine = data(:,2:end);

% Wine LDA
% tic;
% timerVal = tic;
% lda_wine(X_wine, y_wine, X_test_wine, y_test_wine);
% toc;

% tic;
% timerVal = tic;
% qda(X, y, X_test, y_test);
% toc;

% plotPokerHands(X, y);
% plotWine(X_wine, y_wine);
