function LDA = lda_wine(X, y, X_test, y_test)

% Total amount of data vectors
N = size(X);

% Separate data into respective classes
c1 = X(find(y==1), :);
c2 = X(find(y==2), :);
c3 = X(find(y==3), :);

% Compute the mean vectors (centroids)
c1_mu = mean(c1);
c2_mu = mean(c1);
c3_mu = mean(c3);

% Probabilities of classes (also referred to as the prior)
c1_prior = (size(c1) / N);
c2_prior = (size(c1) / N);
c3_prior = (size(c3) / N);

% Compute the covariance of each class matrix independently
c1_covariance = cov(c1);
c2_covariance = cov(c1);
c3_covariance = cov(c3);
% Compute pooled covariance matrix

sigma = zeros(size(X, 2));
for i=size(c1, 1)
  Xi = c1(i);
  sigma = sigma + (Xi - c1_mu)' * (Xi - c1_mu);
end;
for i=size(c2, 1)
  Xi = c2(i);
  sigma = sigma + (Xi - c2_mu)' * (Xi - c2_mu);
end;
for i=size(c3, 1)
  Xi = c3(i);
  sigma = sigma + (Xi - c3_mu)' * (Xi - c3_mu);
end;

% Test the data
% Computing the "guesses" based on the discriminants
% src: http://chrome.ws.dei.polimi.it/images/5/5b/PAMI_homework_2012_2.pdf (pg. 4-5)
sigmaInv = inv(sigma);
constant = X_test * sigmaInv;

discriminant_1 = (log(c1_prior) - (0.5 * (c1_mu * sigmaInv * c1_mu')) + constant * c1_mu');
discriminant_2 = (log(c2_prior) - (0.5 * (c2_mu * sigmaInv * c2_mu')) + constant * c2_mu');
discriminant_3 = (log(c3_prior) - (0.5 * (c3_mu * sigmaInv * c3_mu')) + constant * c3_mu');

counts = zeros(1, 3);
Yout = [];
for i=1:size(X_test)
  discrims = [discriminant_1(i); discriminant_2(i); discriminant_3(i);];
  maxVal = max(discrims);
  switch maxVal
    case discriminant_1(i)
      Yout = [Yout;1];
      counts(1) = counts(1) + 1;
    case discriminant_2(i)
      Yout = [Yout;2];
      counts(2) = counts(2) + 1;
    case discriminant_3(i)
      Yout = [Yout;3];
      counts(3) = counts(3) + 1;
  end;
end;

counts;

accuracy = [y_test == Yout];
correct = size(find(accuracy == 1));
finalPercentage = correct / size(X_test);
accuracy_percent = finalPercentage * 100;
disp(['[WINE] Accuracy of LDA model: ', num2str(accuracy_percent), '%']);


end