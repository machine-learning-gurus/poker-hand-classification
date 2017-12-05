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
c0_prior = (size(c0) / N) * (1 - .501177);
c1_prior = (size(c1) / N) * (1 - .422569);
c2_prior = (size(c1) / N) * (1 - .047539);
c3_prior = (size(c3) / N) * (1 - .021128);
c4_prior = (size(c4) / N) * (1 - .003925);
c5_prior = (size(c5) / N) * (1 - .001965);
c6_prior = (size(c6) / N) * (1 - .001441);
c7_prior = (size(c7) / N) * (1 - .000240);
c8_prior = (size(c8) / N) * (1 - .0000139);
c9_prior = (size(c9) / N) * (1 - .00000154);

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

discriminant_0_vs_1 = log(c0_prior / c1_prior) - (0.5 * ((c0_mu + c1_mu) * sigmaInv * (c0_mu - c1_mu)')) + constant * (c0_mu - c1_mu)';
discriminant_0_vs_2 = log(c0_prior / c2_prior) - (0.5 * ((c0_mu + c2_mu) * sigmaInv * (c0_mu - c2_mu)')) + constant * (c0_mu - c2_mu)';
discriminant_0_vs_3 = log(c0_prior / c3_prior) - (0.5 * ((c0_mu + c3_mu) * sigmaInv * (c0_mu - c3_mu)')) + constant * (c0_mu - c3_mu)';
discriminant_0_vs_4 = log(c0_prior / c4_prior) - (0.5 * ((c0_mu + c4_mu) * sigmaInv * (c0_mu - c4_mu)')) + constant * (c0_mu - c4_mu)';
discriminant_0_vs_5 = log(c0_prior / c5_prior) - (0.5 * ((c0_mu + c5_mu) * sigmaInv * (c0_mu - c5_mu)')) + constant * (c0_mu - c5_mu)';
discriminant_0_vs_6 = log(c0_prior / c6_prior) - (0.5 * ((c0_mu + c6_mu) * sigmaInv * (c0_mu - c6_mu)')) + constant * (c0_mu - c6_mu)';
discriminant_0_vs_7 = log(c0_prior / c7_prior) - (0.5 * ((c0_mu + c7_mu) * sigmaInv * (c0_mu - c7_mu)')) + constant * (c0_mu - c7_mu)';
discriminant_0_vs_8 = log(c0_prior / c8_prior) - (0.5 * ((c0_mu + c8_mu) * sigmaInv * (c0_mu - c8_mu)')) + constant * (c0_mu - c8_mu)';
discriminant_0_vs_9 = log(c0_prior / c9_prior) - (0.5 * ((c0_mu + c9_mu) * sigmaInv * (c0_mu - c9_mu)')) + constant * (c0_mu - c9_mu)';

discriminant_1_vs_0 = log(c1_prior / c0_prior) - (0.5 * ((c1_mu + c0_mu) * sigmaInv * (c1_mu - c0_mu)')) + constant * (c1_mu - c0_mu)';
discriminant_1_vs_2 = log(c1_prior / c2_prior) - (0.5 * ((c1_mu + c2_mu) * sigmaInv * (c1_mu - c2_mu)')) + constant * (c1_mu - c2_mu)';
discriminant_1_vs_3 = log(c1_prior / c3_prior) - (0.5 * ((c1_mu + c3_mu) * sigmaInv * (c1_mu - c3_mu)')) + constant * (c1_mu - c3_mu)';
discriminant_1_vs_4 = log(c1_prior / c4_prior) - (0.5 * ((c1_mu + c4_mu) * sigmaInv * (c1_mu - c4_mu)')) + constant * (c1_mu - c4_mu)';
discriminant_1_vs_5 = log(c1_prior / c5_prior) - (0.5 * ((c1_mu + c5_mu) * sigmaInv * (c1_mu - c5_mu)')) + constant * (c1_mu - c5_mu)';
discriminant_1_vs_6 = log(c1_prior / c6_prior) - (0.5 * ((c1_mu + c6_mu) * sigmaInv * (c1_mu - c6_mu)')) + constant * (c1_mu - c6_mu)';
discriminant_1_vs_7 = log(c1_prior / c7_prior) - (0.5 * ((c1_mu + c7_mu) * sigmaInv * (c1_mu - c7_mu)')) + constant * (c1_mu - c7_mu)';
discriminant_1_vs_8 = log(c1_prior / c8_prior) - (0.5 * ((c1_mu + c8_mu) * sigmaInv * (c1_mu - c8_mu)')) + constant * (c1_mu - c8_mu)';
discriminant_1_vs_9 = log(c1_prior / c9_prior) - (0.5 * ((c1_mu + c9_mu) * sigmaInv * (c1_mu - c9_mu)')) + constant * (c1_mu - c9_mu)';

discriminant_2_vs_0 = log(c2_prior / c0_prior) - (0.5 * ((c2_mu + c0_mu) * sigmaInv * (c2_mu - c0_mu)')) + constant * (c2_mu - c0_mu)';
discriminant_2_vs_1 = log(c2_prior / c1_prior) - (0.5 * ((c2_mu + c1_mu) * sigmaInv * (c2_mu - c1_mu)')) + constant * (c2_mu - c1_mu)';
discriminant_2_vs_3 = log(c2_prior / c3_prior) - (0.5 * ((c2_mu + c3_mu) * sigmaInv * (c2_mu - c3_mu)')) + constant * (c2_mu - c3_mu)';
discriminant_2_vs_4 = log(c2_prior / c4_prior) - (0.5 * ((c2_mu + c4_mu) * sigmaInv * (c2_mu - c4_mu)')) + constant * (c2_mu - c4_mu)';
discriminant_2_vs_5 = log(c2_prior / c5_prior) - (0.5 * ((c2_mu + c5_mu) * sigmaInv * (c2_mu - c5_mu)')) + constant * (c2_mu - c5_mu)';
discriminant_2_vs_6 = log(c2_prior / c6_prior) - (0.5 * ((c2_mu + c6_mu) * sigmaInv * (c2_mu - c6_mu)')) + constant * (c2_mu - c6_mu)';
discriminant_2_vs_7 = log(c2_prior / c7_prior) - (0.5 * ((c2_mu + c7_mu) * sigmaInv * (c2_mu - c7_mu)')) + constant * (c2_mu - c7_mu)';
discriminant_2_vs_8 = log(c2_prior / c8_prior) - (0.5 * ((c2_mu + c8_mu) * sigmaInv * (c2_mu - c8_mu)')) + constant * (c2_mu - c8_mu)';
discriminant_2_vs_9 = log(c2_prior / c9_prior) - (0.5 * ((c2_mu + c9_mu) * sigmaInv * (c2_mu - c9_mu)')) + constant * (c2_mu - c9_mu)';

discriminant_3_vs_0 = log(c3_prior / c0_prior) - (0.5 * ((c3_mu + c0_mu) * sigmaInv * (c3_mu - c0_mu)')) + constant * (c3_mu - c0_mu)';
discriminant_3_vs_1 = log(c3_prior / c1_prior) - (0.5 * ((c3_mu + c1_mu) * sigmaInv * (c3_mu - c1_mu)')) + constant * (c3_mu - c1_mu)';
discriminant_3_vs_2 = log(c3_prior / c2_prior) - (0.5 * ((c3_mu + c2_mu) * sigmaInv * (c3_mu - c2_mu)')) + constant * (c3_mu - c2_mu)';
discriminant_3_vs_4 = log(c3_prior / c4_prior) - (0.5 * ((c3_mu + c4_mu) * sigmaInv * (c3_mu - c4_mu)')) + constant * (c3_mu - c4_mu)';
discriminant_3_vs_5 = log(c3_prior / c5_prior) - (0.5 * ((c3_mu + c5_mu) * sigmaInv * (c3_mu - c5_mu)')) + constant * (c3_mu - c5_mu)';
discriminant_3_vs_6 = log(c3_prior / c6_prior) - (0.5 * ((c3_mu + c6_mu) * sigmaInv * (c3_mu - c6_mu)')) + constant * (c3_mu - c6_mu)';
discriminant_3_vs_7 = log(c3_prior / c7_prior) - (0.5 * ((c3_mu + c7_mu) * sigmaInv * (c3_mu - c7_mu)')) + constant * (c3_mu - c7_mu)';
discriminant_3_vs_8 = log(c3_prior / c8_prior) - (0.5 * ((c3_mu + c8_mu) * sigmaInv * (c3_mu - c8_mu)')) + constant * (c3_mu - c8_mu)';
discriminant_3_vs_9 = log(c3_prior / c9_prior) - (0.5 * ((c3_mu + c9_mu) * sigmaInv * (c3_mu - c9_mu)')) + constant * (c3_mu - c9_mu)';

discriminant_4_vs_0 = log(c4_prior / c0_prior) - (0.5 * ((c4_mu + c0_mu) * sigmaInv * (c4_mu - c0_mu)')) + constant * (c4_mu - c0_mu)';
discriminant_4_vs_1 = log(c4_prior / c1_prior) - (0.5 * ((c4_mu + c1_mu) * sigmaInv * (c4_mu - c1_mu)')) + constant * (c4_mu - c1_mu)';
discriminant_4_vs_2 = log(c4_prior / c2_prior) - (0.5 * ((c4_mu + c2_mu) * sigmaInv * (c4_mu - c2_mu)')) + constant * (c4_mu - c2_mu)';
discriminant_4_vs_3 = log(c4_prior / c3_prior) - (0.5 * ((c4_mu + c3_mu) * sigmaInv * (c4_mu - c3_mu)')) + constant * (c4_mu - c3_mu)';
discriminant_4_vs_5 = log(c4_prior / c5_prior) - (0.5 * ((c4_mu + c5_mu) * sigmaInv * (c4_mu - c5_mu)')) + constant * (c4_mu - c5_mu)';
discriminant_4_vs_6 = log(c4_prior / c6_prior) - (0.5 * ((c4_mu + c6_mu) * sigmaInv * (c4_mu - c6_mu)')) + constant * (c4_mu - c6_mu)';
discriminant_4_vs_7 = log(c4_prior / c7_prior) - (0.5 * ((c4_mu + c7_mu) * sigmaInv * (c4_mu - c7_mu)')) + constant * (c4_mu - c7_mu)';
discriminant_4_vs_8 = log(c4_prior / c8_prior) - (0.5 * ((c4_mu + c8_mu) * sigmaInv * (c4_mu - c8_mu)')) + constant * (c4_mu - c8_mu)';
discriminant_4_vs_9 = log(c4_prior / c9_prior) - (0.5 * ((c4_mu + c9_mu) * sigmaInv * (c4_mu - c9_mu)')) + constant * (c4_mu - c9_mu)';

discriminant_5_vs_0 = log(c5_prior / c0_prior) - (0.5 * ((c5_mu + c0_mu) * sigmaInv * (c5_mu - c0_mu)')) + constant * (c5_mu - c0_mu)';
discriminant_5_vs_1 = log(c5_prior / c1_prior) - (0.5 * ((c5_mu + c1_mu) * sigmaInv * (c5_mu - c1_mu)')) + constant * (c5_mu - c1_mu)';
discriminant_5_vs_2 = log(c5_prior / c2_prior) - (0.5 * ((c5_mu + c2_mu) * sigmaInv * (c5_mu - c2_mu)')) + constant * (c5_mu - c2_mu)';
discriminant_5_vs_3 = log(c5_prior / c3_prior) - (0.5 * ((c5_mu + c3_mu) * sigmaInv * (c5_mu - c3_mu)')) + constant * (c5_mu - c3_mu)';
discriminant_5_vs_4 = log(c5_prior / c4_prior) - (0.5 * ((c5_mu + c4_mu) * sigmaInv * (c5_mu - c4_mu)')) + constant * (c5_mu - c4_mu)';
discriminant_5_vs_6 = log(c5_prior / c6_prior) - (0.5 * ((c5_mu + c6_mu) * sigmaInv * (c5_mu - c6_mu)')) + constant * (c5_mu - c6_mu)';
discriminant_5_vs_7 = log(c5_prior / c7_prior) - (0.5 * ((c5_mu + c7_mu) * sigmaInv * (c5_mu - c7_mu)')) + constant * (c5_mu - c7_mu)';
discriminant_5_vs_8 = log(c5_prior / c8_prior) - (0.5 * ((c5_mu + c8_mu) * sigmaInv * (c5_mu - c8_mu)')) + constant * (c5_mu - c8_mu)';
discriminant_5_vs_9 = log(c5_prior / c9_prior) - (0.5 * ((c5_mu + c9_mu) * sigmaInv * (c5_mu - c9_mu)')) + constant * (c5_mu - c9_mu)';

discriminant_6_vs_0 = log(c6_prior / c0_prior) - (0.5 * ((c6_mu + c0_mu) * sigmaInv * (c6_mu - c0_mu)')) + constant * (c6_mu - c0_mu)';
discriminant_6_vs_1 = log(c6_prior / c1_prior) - (0.5 * ((c6_mu + c1_mu) * sigmaInv * (c6_mu - c1_mu)')) + constant * (c6_mu - c1_mu)';
discriminant_6_vs_2 = log(c6_prior / c2_prior) - (0.5 * ((c6_mu + c2_mu) * sigmaInv * (c6_mu - c2_mu)')) + constant * (c6_mu - c2_mu)';
discriminant_6_vs_3 = log(c6_prior / c3_prior) - (0.5 * ((c6_mu + c3_mu) * sigmaInv * (c6_mu - c3_mu)')) + constant * (c6_mu - c3_mu)';
discriminant_6_vs_4 = log(c6_prior / c4_prior) - (0.5 * ((c6_mu + c4_mu) * sigmaInv * (c6_mu - c4_mu)')) + constant * (c6_mu - c4_mu)';
discriminant_6_vs_5 = log(c6_prior / c5_prior) - (0.5 * ((c6_mu + c5_mu) * sigmaInv * (c6_mu - c5_mu)')) + constant * (c6_mu - c5_mu)';
discriminant_6_vs_7 = log(c6_prior / c7_prior) - (0.5 * ((c6_mu + c7_mu) * sigmaInv * (c6_mu - c7_mu)')) + constant * (c6_mu - c7_mu)';
discriminant_6_vs_8 = log(c6_prior / c8_prior) - (0.5 * ((c6_mu + c8_mu) * sigmaInv * (c6_mu - c8_mu)')) + constant * (c6_mu - c8_mu)';
discriminant_6_vs_9 = log(c6_prior / c9_prior) - (0.5 * ((c6_mu + c9_mu) * sigmaInv * (c6_mu - c9_mu)')) + constant * (c6_mu - c9_mu)';

discriminant_7_vs_0 = log(c7_prior / c0_prior) - (0.5 * ((c7_mu + c0_mu) * sigmaInv * (c7_mu - c0_mu)')) + constant * (c7_mu - c0_mu)';
discriminant_7_vs_1 = log(c7_prior / c1_prior) - (0.5 * ((c7_mu + c1_mu) * sigmaInv * (c7_mu - c1_mu)')) + constant * (c7_mu - c1_mu)';
discriminant_7_vs_2 = log(c7_prior / c2_prior) - (0.5 * ((c7_mu + c2_mu) * sigmaInv * (c7_mu - c2_mu)')) + constant * (c7_mu - c2_mu)';
discriminant_7_vs_3 = log(c7_prior / c3_prior) - (0.5 * ((c7_mu + c3_mu) * sigmaInv * (c7_mu - c3_mu)')) + constant * (c7_mu - c3_mu)';
discriminant_7_vs_4 = log(c7_prior / c4_prior) - (0.5 * ((c7_mu + c4_mu) * sigmaInv * (c7_mu - c4_mu)')) + constant * (c7_mu - c4_mu)';
discriminant_7_vs_5 = log(c7_prior / c5_prior) - (0.5 * ((c7_mu + c5_mu) * sigmaInv * (c7_mu - c5_mu)')) + constant * (c7_mu - c5_mu)';
discriminant_7_vs_6 = log(c7_prior / c6_prior) - (0.5 * ((c7_mu + c6_mu) * sigmaInv * (c7_mu - c6_mu)')) + constant * (c7_mu - c6_mu)';
discriminant_7_vs_8 = log(c7_prior / c8_prior) - (0.5 * ((c7_mu + c8_mu) * sigmaInv * (c7_mu - c8_mu)')) + constant * (c7_mu - c8_mu)';
discriminant_7_vs_9 = log(c7_prior / c9_prior) - (0.5 * ((c7_mu + c9_mu) * sigmaInv * (c7_mu - c9_mu)')) + constant * (c7_mu - c9_mu)';

discriminant_8_vs_0 = log(c8_prior / c0_prior) - (0.5 * ((c8_mu + c0_mu) * sigmaInv * (c8_mu - c0_mu)')) + constant * (c8_mu - c0_mu)';
discriminant_8_vs_1 = log(c8_prior / c1_prior) - (0.5 * ((c8_mu + c1_mu) * sigmaInv * (c8_mu - c1_mu)')) + constant * (c8_mu - c1_mu)';
discriminant_8_vs_2 = log(c8_prior / c2_prior) - (0.5 * ((c8_mu + c2_mu) * sigmaInv * (c8_mu - c2_mu)')) + constant * (c8_mu - c2_mu)';
discriminant_8_vs_3 = log(c8_prior / c3_prior) - (0.5 * ((c8_mu + c3_mu) * sigmaInv * (c8_mu - c3_mu)')) + constant * (c8_mu - c3_mu)';
discriminant_8_vs_4 = log(c8_prior / c4_prior) - (0.5 * ((c8_mu + c4_mu) * sigmaInv * (c8_mu - c4_mu)')) + constant * (c8_mu - c4_mu)';
discriminant_8_vs_5 = log(c8_prior / c5_prior) - (0.5 * ((c8_mu + c5_mu) * sigmaInv * (c8_mu - c5_mu)')) + constant * (c8_mu - c5_mu)';
discriminant_8_vs_6 = log(c8_prior / c6_prior) - (0.5 * ((c8_mu + c6_mu) * sigmaInv * (c8_mu - c6_mu)')) + constant * (c8_mu - c6_mu)';
discriminant_8_vs_7 = log(c8_prior / c7_prior) - (0.5 * ((c8_mu + c7_mu) * sigmaInv * (c8_mu - c7_mu)')) + constant * (c8_mu - c7_mu)';
discriminant_8_vs_9 = log(c8_prior / c9_prior) - (0.5 * ((c8_mu + c9_mu) * sigmaInv * (c8_mu - c9_mu)')) + constant * (c8_mu - c9_mu)';

discriminant_9_vs_0 = log(c9_prior / c0_prior) - (0.5 * ((c9_mu + c0_mu) * sigmaInv * (c9_mu - c0_mu)')) + constant * (c9_mu - c0_mu)';
discriminant_9_vs_1 = log(c9_prior / c1_prior) - (0.5 * ((c9_mu + c1_mu) * sigmaInv * (c9_mu - c1_mu)')) + constant * (c9_mu - c1_mu)';
discriminant_9_vs_2 = log(c9_prior / c2_prior) - (0.5 * ((c9_mu + c2_mu) * sigmaInv * (c9_mu - c2_mu)')) + constant * (c9_mu - c2_mu)';
discriminant_9_vs_3 = log(c9_prior / c3_prior) - (0.5 * ((c9_mu + c3_mu) * sigmaInv * (c9_mu - c3_mu)')) + constant * (c9_mu - c3_mu)';
discriminant_9_vs_4 = log(c9_prior / c4_prior) - (0.5 * ((c9_mu + c4_mu) * sigmaInv * (c9_mu - c4_mu)')) + constant * (c9_mu - c4_mu)';
discriminant_9_vs_5 = log(c9_prior / c5_prior) - (0.5 * ((c9_mu + c5_mu) * sigmaInv * (c9_mu - c5_mu)')) + constant * (c9_mu - c5_mu)';
discriminant_9_vs_6 = log(c9_prior / c6_prior) - (0.5 * ((c9_mu + c6_mu) * sigmaInv * (c9_mu - c6_mu)')) + constant * (c9_mu - c6_mu)';
discriminant_9_vs_7 = log(c9_prior / c7_prior) - (0.5 * ((c9_mu + c7_mu) * sigmaInv * (c9_mu - c7_mu)')) + constant * (c9_mu - c7_mu)';
discriminant_9_vs_8 = log(c9_prior / c8_prior) - (0.5 * ((c9_mu + c8_mu) * sigmaInv * (c9_mu - c8_mu)')) + constant * (c9_mu - c8_mu)';

counts = zeros(1, 10);
vs_counts = zeros(1, 10);

for i=1:size(X_test)
  vs_discrims = [discriminant_0_vs_1(i); discriminant_1_vs_0(i)];
  vs_maxVal = max(vs_discrims);
  switch vs_maxVal
    case discriminant_0_vs_1(i)
      vs_counts(1) = vs_counts(1) + 1;
    case discriminant_1_vs_0(i)
      vs_counts(2) = vs_counts(2) + 1;
  end;
end

Yout = [];
for i=1:size(X_test)
  discrims = [discriminant_0(i); discriminant_1(i); discriminant_2(i); discriminant_3(i); discriminant_4(i); discriminant_5(i); discriminant_6(i); discriminant_7(i); discriminant_8(i); discriminant_9(i)];
  maxVal = max(discrims);
  switch maxVal
    case discriminant_0(i)
      Yout = [Yout;0];
      counts(1) = counts(1) + 1;
    case discriminant_1(i)
      Yout = [Yout;1];
      counts(2) = counts(2) + 1;
    case discriminant_2(i)
      Yout = [Yout;2];
      counts(3) = counts(3) + 1;
    case discriminant_3(i)
      Yout = [Yout;3];
      counts(4) = counts(4) + 1;
    case discriminant_4(i)
      Yout = [Yout;4];
      counts(5) = counts(5) + 1;
    case discriminant_5(i)
      Yout = [Yout;5];
      counts(6) = counts(6) + 1;
    case discriminant_6(i)
      Yout = [Yout;6];
      counts(7) = counts(7) + 1;
    case discriminant_7(i)
      Yout = [Yout;7];
      counts(8) = counts(8) + 1;
    case discriminant_8(i)
      Yout = [Yout;8];
      counts(9) = counts(9) + 1;
    case discriminant_9(i)
      Yout = [Yout;9];
      counts(10) = counts(10) + 1;
  end;
end;

counts
vs_counts

accuracy = [y_test == Yout];
correct = size(find(accuracy == 1));
finalPercentage = correct / size(X_test);
accuracy_percent = finalPercentage * 100;
disp(['Accuracy of LDA model: ', num2str(accuracy_percent), '%']);


end