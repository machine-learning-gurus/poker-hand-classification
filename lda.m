function LDA = lda(X, y, X_test, y_test)

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
c0_covariance = cov(c0);
c1_covariance = cov(c1);
c2_covariance = cov(c1);
c3_covariance = cov(c3);
c4_covariance = cov(c4);
c5_covariance = cov(c5);
c6_covariance = cov(c6);
c7_covariance = cov(c7);
c8_covariance = cov(c8);
c9_covariance = cov(c9);

% Compute pooled covariance matrix
% C = [(n_1 * C_1) + (n_2 * C_2) + ( ... )] / (n_1 + n_2 + ...)

n0 = size(c0, 1);
n1 = size(c1, 1);
n2 = size(c2, 1);
n3 = size(c3, 1);
n4 = size(c4, 1);
n5 = size(c5, 1);
n6 = size(c6, 1);
n7 = size(c7, 1);
n8 = size(c8, 1);
n9 = size(c9, 1);
pooled_covariance = ...
  ((n0 * c0_covariance) + ...
  (n1 * c1_covariance) + ...
  (n2 * c2_covariance) + ...
  (n3 * c3_covariance) + ...
  (n4 * c4_covariance) + ...
  (n5 * c5_covariance) + ...
  (n6 * c6_covariance) + ...
  (n7 * c7_covariance) + ...
  (n8 * c8_covariance) + ...
  (n9 * c9_covariance)) / ...
  (n0 + n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8 + n9);

% Test the data
% Computing the "guesses" based on the discriminants
% src: http://chrome.ws.dei.polimi.it/images/5/5b/PAMI_homework_2012_2.pdf (pg. 4-5)
sigmaInv = inv(pooled_covariance);
constant = X_test * sigmaInv;

discriminant_0 = log(c0_prior) - (0.5 * (c0_mu * sigmaInv * c0_mu')) + constant * c0_mu';
discriminant_1 = log(c1_prior) - (0.5 * (c1_mu * sigmaInv * c1_mu')) + constant * c1_mu';
discriminant_2 = log(c2_prior) - (0.5 * (c2_mu * sigmaInv * c2_mu')) + constant * c2_mu';
discriminant_3 = log(c3_prior) - (0.5 * (c3_mu * sigmaInv * c3_mu')) + constant * c3_mu';
discriminant_4 = log(c4_prior) - (0.5 * (c4_mu * sigmaInv * c4_mu')) + constant * c4_mu';
discriminant_5 = log(c5_prior) - (0.5 * (c5_mu * sigmaInv * c5_mu')) + constant * c5_mu';
discriminant_6 = log(c6_prior) - (0.5 * (c6_mu * sigmaInv * c6_mu')) + constant * c6_mu';
discriminant_7 = log(c7_prior) - (0.5 * (c7_mu * sigmaInv * c7_mu')) + constant * c7_mu';
discriminant_8 = log(c8_prior) - (0.5 * (c8_mu * sigmaInv * c8_mu')) + constant * c8_mu';
discriminant_9 = log(c9_prior) - (0.5 * (c9_mu * sigmaInv * c9_mu')) + constant * c9_mu';

Yout = [];
for i=1:size(X_test)
  discrims = [discriminant_0(i); discriminant_1(i); discriminant_2(i); discriminant_3(i); discriminant_4(i); discriminant_5(i); discriminant_6(i); discriminant_7(i); discriminant_8(i); discriminant_9(i)];
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
disp(['Accuracy of LDA model: ', num2str(accuracy_percent), '%']);


end