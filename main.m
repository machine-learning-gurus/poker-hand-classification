clear all; close all;

data = dlmread("data/poker-hand-training-true.data",",");
y = data(:,end);
X = data(:,1:end-1);

% LDA
lda(X, y);
