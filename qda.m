function qda = qda(X, y, X_test, y_test)

% Total amount of data vectors
N = size(X);

% Separate data into respective classes
c0 = X(find(y==0), :);
c1 = X(find(y==1), :);
c2 = X(find(y==2), :);
c3 = X(find(y==3), :);
c4 = X(find(y==4), :);
c5 = X(find(y==5), :);
c6 = X(find(y==6), :);
c7 = X(find(y==7), :);
c8 = X(find(y==8), :);
c9 = X(find(y==9), :);

% Compute the mean vectors (centroids)
c0_mu = mean(c0);
c1_mu = mean(c1);
c2_mu = mean(c1);
c3_mu = mean(c3);
c4_mu = mean(c4);
c5_mu = mean(c5);
c6_mu = mean(c6);
c7_mu = mean(c7);
c8_mu = mean(c8);
c9_mu = mean(c9);

% Probabilities of classes (also referred to as the prior)
c0_prior = size(c0) / N;
c1_prior = size(c1) / N;
c2_prior = size(c1) / N;
c3_prior = size(c3) / N;
c4_prior = size(c4) / N;
c5_prior = size(c5) / N;
c6_prior = size(c6) / N;
c7_prior = size(c7) / N;
c8_prior = size(c8) / N;
c9_prior = size(c9) / N;

% Compute the covariance of each class matrix independently

c0cov = cov(c0);
c1cov = cov(c1);
c2cov = cov(c2);
c3cov = cov(c3);
c4cov = cov(c4);
c5cov = cov(c5);
c6cov = cov(c6);
c7cov = cov(c7);
c8cov = cov(c8);
c9cov = cov(c9);

% Test the data

%equation for computing discriminant comes from:
%https://onlinecourses.science.psu.edu/stat857/node/80

discriminant_0 = log(c0_prior) - (((X_test*inv(c0cov))*(c0_mu')) * (0.5 * (c0_mu))) - (0.5 * log(abs(X_test*c0cov)));
discriminant_1 = log(c1_prior) - (((X_test*inv(c1cov))*(c1_mu')) * (0.5 * (c1_mu))) - (0.5 * log(abs(X_test*c1cov)));
discriminant_2 = log(c2_prior) - (((X_test*inv(c2cov))*(c2_mu')) * (0.5 * (c2_mu))) - (0.5 * log(abs(X_test*c2cov)));
discriminant_3 = log(c3_prior) - (((X_test*inv(c3cov))*(c3_mu')) * (0.5 * (c3_mu))) - (0.5 * log(abs(X_test*c3cov)));
discriminant_4 = log(c4_prior) - (((X_test*inv(c4cov))*(c4_mu')) * (0.5 * (c4_mu))) - (0.5 * log(abs(X_test*c4cov)));
discriminant_5 = log(c5_prior) - (((X_test*inv(c5cov))*(c5_mu')) * (0.5 * (c5_mu))) - (0.5 * log(abs(X_test*c5cov)));
discriminant_6 = log(c6_prior) - (((X_test*inv(c6cov))*(c6_mu')) * (0.5 * (c6_mu))) - (0.5 * log(abs(X_test*c6cov)));
discriminant_7 = log(c7_prior) - (((X_test*inv(c7cov))*(c7_mu')) * (0.5 * (c7_mu))) - (0.5 * log(abs(X_test*c7cov)));
discriminant_8 = log(c8_prior) - (((X_test*inv(c8cov))*(c8_mu')) * (0.5 * (c8_mu))) - (0.5 * log(abs(X_test*c8cov)));
discriminant_9 = log(c9_prior) - (((X_test*inv(c9cov))*(c9_mu')) * (0.5 * (c9_mu))) - (0.5 * log(abs(X_test*c9cov)));

Yout = [];
for i=1:size(X_test)
  discrims = [max(discriminant_0(i)); max(discriminant_1(i)); max(discriminant_2(i)); max(discriminant_3(i)); max(discriminant_4(i)); max(discriminant_5(i)); max(discriminant_6(i)); max(discriminant_7(i)); max(discriminant_8(i)); max(discriminant_9(i))];
  maxVal = max(discrims);
  switch maxVal
    case discriminant_0(i)
      Yout = [Yout;0];
    case discriminant_1(i)
      Yout = [Yout;1];
    case discriminant_2(i)
      Yout = [Yout;2];
    case discriminant_3(i)
      Yout = [Yout;3];
    case discriminant_4(i)
      Yout = [Yout;4];
    case discriminant_5(i)
      Yout = [Yout;5];
    case discriminant_6(i)
      Yout = [Yout;6];
    case discriminant_7(i)
      Yout = [Yout;7];
    case discriminant_8(i)
      Yout = [Yout;8];
    case discriminant_9(i)
      Yout = [Yout;9];
  end;
end;  

accuracy = [y_test == Yout];
correct = size(find(accuracy == 1));
finalPercentage = correct / size(X_test);
accuracy_percent = finalPercentage * 100;
disp(['Accuracy of QDA model: ', num2str(accuracy_percent), '%']);


end