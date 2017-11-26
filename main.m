clear all; close all;

data = dlmread("data/poker-hand-training-true.data",",");
y = data(:,end);
X = data(:,1:end-1);

test_data = dlmread("data/poker-hand-testing.data",",");
y_test = test_data(:,end);
X_test = test_data(:,1:end-1);

% LDA
t_start = time();
lda(X, y, X_test, y_test);
t_end = time();
disp(['Running this LDA model took ', num2str(t_end - t_start), ' seconds.']);
