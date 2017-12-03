function naive = naive(X, y, X_test, y_test)

%using a general wikipedia article for info:
%https://en.wikipedia.org/wiki/Naive_Bayes_classifier


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

%this is me starting to try and compute the various "probability of card
%1's suit being '3'" and so on that we will need to compute the total
%probabilities per class.

suit_1_1 = size(X(find(X(0) == 1), :)) / N;
suit_1_2 = size(X(find(X(0) == 2), :)) / N;
suit_1_3 = size(X(find(X(0) == 3), :)) / N;
suit_1_4 = size(X(find(X(0) == 4), :)) / N;
suit_2_1 = size(X(find(X(2) == 1), :)) / N;
suit_2_2 = size(X(find(X(2) == 2), :)) / N;
suit_2_3 = size(X(find(X(2) == 3), :)) / N;
suit_2_4 = size(X(find(X(2) == 4), :)) / N;
suit_3_1 = size(X(find(X(4) == 1), :)) / N;
suit_3_2 = size(X(find(X(4) == 2), :)) / N;
suit_3_3 = size(X(find(X(4) == 3), :)) / N;
suit_3_4 = size(X(find(X(4) == 4), :)) / N;
suit_4_1 = size(X(find(X(6) == 1), :)) / N;
suit_4_2 = size(X(find(X(6) == 2), :)) / N;
suit_4_3 = size(X(find(X(6) == 3), :)) / N;
suit_4_4 = size(X(find(X(6) == 4), :)) / N;
suit_5_1 = size(X(find(X(8) == 1), :)) / N;
suit_5_2 = size(X(find(X(8) == 2), :)) / N;
suit_5_3 = size(X(find(X(8) == 3), :)) / N;
suit_5_4 = size(X(find(X(8) == 4), :)) / N;

value_1_1 = size(X(find(X(1) == 1), :)) / N;
value_1_2 = size(X(find(X(1) == 2), :)) / N;
value_1_3 = size(X(find(X(1) == 3), :)) / N;
value_1_4 = size(X(find(X(1) == 4), :)) / N;
value_1_5 = size(X(find(X(1) == 5), :)) / N;
value_1_6 = size(X(find(X(1) == 6), :)) / N;
value_1_7 = size(X(find(X(1) == 7), :)) / N;
value_1_8 = size(X(find(X(1) == 8), :)) / N;
value_1_9 = size(X(find(X(1) == 9), :)) / N;
value_1_10 = size(X(find(X(1) == 10), :)) / N;
value_1_11 = size(X(find(X(1) == 11), :)) / N;
value_1_12 = size(X(find(X(1) == 12), :)) / N;
value_1_13 = size(X(find(X(1) == 13), :)) / N;

value_1_1 = size(X(find(X(1) == 1), :)) / N;
value_1_2 = size(X(find(X(1) == 2), :)) / N;
value_1_3 = size(X(find(X(1) == 3), :)) / N;
value_1_4 = size(X(find(X(1) == 4), :)) / N;
value_1_5 = size(X(find(X(1) == 5), :)) / N;
value_1_6 = size(X(find(X(1) == 6), :)) / N;
value_1_7 = size(X(find(X(1) == 7), :)) / N;
value_1_8 = size(X(find(X(1) == 8), :)) / N;
value_1_9 = size(X(find(X(1) == 9), :)) / N;
value_1_10 = size(X(find(X(1) == 10), :)) / N;
value_1_11 = size(X(find(X(1) == 11), :)) / N;
value_1_12 = size(X(find(X(1) == 12), :)) / N;
value_1_13 = size(X(find(X(1) == 13), :)) / N;

value_2_1 = size(X(find(X(3) == 1), :)) / N;
value_2_2 = size(X(find(X(3) == 2), :)) / N;
value_2_3 = size(X(find(X(3) == 3), :)) / N;
value_2_4 = size(X(find(X(3) == 4), :)) / N;
value_2_5 = size(X(find(X(3) == 5), :)) / N;
value_2_6 = size(X(find(X(3) == 6), :)) / N;
value_2_7 = size(X(find(X(3) == 7), :)) / N;
value_2_8 = size(X(find(X(3) == 8), :)) / N;
value_2_9 = size(X(find(X(3) == 9), :)) / N;
value_2_10 = size(X(find(X(3) == 10), :)) / N;
value_2_11 = size(X(find(X(3) == 11), :)) / N;
value_2_12 = size(X(find(X(3) == 12), :)) / N;
value_2_13 = size(X(find(X(3) == 13), :)) / N;

value_3_1 = size(X(find(X(5) == 1), :)) / N;
value_3_2 = size(X(find(X(5) == 2), :)) / N;
value_3_3 = size(X(find(X(5) == 3), :)) / N;
value_3_4 = size(X(find(X(5) == 4), :)) / N;
value_3_5 = size(X(find(X(5) == 5), :)) / N;
value_3_6 = size(X(find(X(5) == 6), :)) / N;
value_3_7 = size(X(find(X(5) == 7), :)) / N;
value_3_8 = size(X(find(X(5) == 8), :)) / N;
value_3_9 = size(X(find(X(5) == 9), :)) / N;
value_3_10 = size(X(find(X(5) == 10), :)) / N;
value_3_11 = size(X(find(X(5) == 11), :)) / N;
value_3_12 = size(X(find(X(5) == 12), :)) / N;
value_3_13 = size(X(find(X(5) == 13), :)) / N;

value_4_1 = size(X(find(X(7) == 1), :)) / N;
value_4_2 = size(X(find(X(7) == 2), :)) / N;
value_4_3 = size(X(find(X(7) == 3), :)) / N;
value_4_4 = size(X(find(X(7) == 4), :)) / N;
value_4_5 = size(X(find(X(7) == 5), :)) / N;
value_4_6 = size(X(find(X(7) == 6), :)) / N;
value_4_7 = size(X(find(X(7) == 7), :)) / N;
value_4_8 = size(X(find(X(7) == 8), :)) / N;
value_4_9 = size(X(find(X(7) == 9), :)) / N;
value_4_10 = size(X(find(X(7) == 10), :)) / N;
value_4_11 = size(X(find(X(7) == 11), :)) / N;
value_4_12 = size(X(find(X(7) == 12), :)) / N;
value_4_13 = size(X(find(X(7) == 13), :)) / N;

value_5_1 = size(X(find(X(9) == 1), :)) / N;
value_5_2 = size(X(find(X(9) == 2), :)) / N;
value_5_3 = size(X(find(X(9) == 3), :)) / N;
value_5_4 = size(X(find(X(9) == 4), :)) / N;
value_5_5 = size(X(find(X(9) == 5), :)) / N;
value_5_6 = size(X(find(X(9) == 6), :)) / N;
value_5_7 = size(X(find(X(9) == 7), :)) / N;
value_5_8 = size(X(find(X(9) == 8), :)) / N;
value_5_9 = size(X(find(X(9) == 9), :)) / N;
value_5_10 = size(X(find(X(9) == 10), :)) / N;
value_5_11 = size(X(find(X(9) == 11), :)) / N;
value_5_12 = size(X(find(X(9) == 12), :)) / N;
value_5_13 = size(X(find(X(9) == 13), :)) / N;

%we need a way to be able to calculate each probability for each class by 
%adding up the various probabilities of each input value:
%example for probability of class C1 we need to use bayes alg which means
%we will need P(C1|x) = (P(C1) * P(x|C1)) / P(x)
%so we need the probability values, A TON of them



accuracy = [y_test == Yout];
correct = size(find(accuracy == 1));
finalPercentage = correct / size(X_test);
accuracy_percent = finalPercentage * 100;
disp(['Accuracy of QDA model: ', num2str(accuracy_percent), '%']);


end