data = dlmread("data/poker-hand-training-true.data",",");
y = data(:,end);
X = data(:,1:end-1);

% Separate data into respective classes
c0 = c1 = c2 = c3 = c4 = c5 = c6 = c7 = c8 = c9 = [];
for c = 1:size(X)
  switch y(c)
    case 0
      c0 = [c0;X(c, :)];
    case 1
      c1 = [c1;X(c, :)];
    case 2
      c2 = [c2;X(c, :)];
    case 3
      c3 = [c3;X(c, :)];
    case 4
      c4 = [c4;X(c, :)];
    case 5
      c5 = [c5;X(c, :)];
    case 6
      c6 = [c6;X(c, :)];
    case 7
      c7 = [c7;X(c, :)];
    case 8
      c8 = [c8;X(c, :)];
    case 9
      c9 = [c9;X(c, :)];
  end;
end;



%probabilities of classes 

pr0 = size(c0)/size(X);
pr1 = size(c1)/size(X);
pr2 = size(c2)/size(X);
pr3 = size(c3)/size(X);
pr4 = size(c4)/size(X);
pr5 = size(c5)/size(X);
pr6 = size(c6)/size(X);
pr7 = size(c7)/size(X);
pr8 = size(c8)/size(X);
pr9 = size(c9)/size(X);

% Compute the means (centroids)
c0mean = mean(c0);
c1mean = mean(c1);
c2mean = mean(c2);
c3mean = mean(c3);
c4mean = mean(c4);
c5mean = mean(c5);
c6mean = mean(c6);
c7mean = mean(c7);
c8mean = mean(c8);
c9mean = mean(c9);


%Compute the covariance matrices

sigma = zeros(size(X, 2));
for i=size(c0, 1)
  Xi = c0(i);
  sigma = sigma + (Xi - c0mean)' * (Xi - c0mean);
end;
for i=size(c1, 1)
  Xi = c1(i);
  sigma = sigma + (Xi - c1mean)' * (Xi - c1mean);
end;
for i=size(c2, 1)
  Xi = c2(i);
  sigma = sigma + (Xi - c2mean)' * (Xi - c2mean);
end;
for i=size(c3, 1)
  Xi = c3(i);
  sigma = sigma + (Xi - c3mean)' * (Xi - c3mean);
end;
for i=size(c4, 1)
  Xi = c4(i);
  sigma = sigma + (Xi - c4mean)' * (Xi - c4mean);
end;
for i=size(c5, 1)
  Xi = c5(i);
  sigma = sigma + (Xi - c5mean)' * (Xi - c5mean);
end;
for i=size(c6, 1)
  Xi = c6(i);
  sigma = sigma + (Xi - c6mean)' * (Xi - c6mean);
end;
for i=size(c7, 1)
  Xi = c7(i);
  sigma = sigma + (Xi - c7mean)' * (Xi - c7mean);
end;
for i=size(c8, 1)
  Xi = c8(i);
  sigma = sigma + (Xi - c8mean)' * (Xi - c8mean);
end;
for i=size(c9, 1)
  Xi = c9(i);
  sigma = sigma + (Xi - c9mean)' * (Xi - c9mean);
end;


%going to use X, c0-9mean, sigma, pr0-9 to calculate the discriminants

sigmaInv = inv(sigma);

discriminant_0 = X*sigmaInv*c0mean' - 0.5*c0mean*sigmaInv*c0mean' + log(pr0);
discriminant_1 = X*sigmaInv*c1mean' - 0.5*c1mean*sigmaInv*c1mean' + log(pr1);
discriminant_2 = X*sigmaInv*c2mean' - 0.5*c2mean*sigmaInv*c2mean' + log(pr2);
discriminant_3 = X*sigmaInv*c3mean' - 0.5*c3mean*sigmaInv*c3mean' + log(pr3);
discriminant_4 = X*sigmaInv*c4mean' - 0.5*c4mean*sigmaInv*c4mean' + log(pr4);
discriminant_5 = X*sigmaInv*c5mean' - 0.5*c5mean*sigmaInv*c5mean' + log(pr5);
discriminant_6 = X*sigmaInv*c6mean' - 0.5*c6mean*sigmaInv*c6mean' + log(pr6);
discriminant_7 = X*sigmaInv*c7mean' - 0.5*c7mean*sigmaInv*c7mean' + log(pr7);
discriminant_8 = X*sigmaInv*c8mean' - 0.5*c8mean*sigmaInv*c8mean' + log(pr8);
discriminant_9 = X*sigmaInv*c9mean' - 0.5*c9mean*sigmaInv*c9mean' + log(pr9);


%computing the "guesses" based on the discriminants
Yout = [];
for i=1:size(X)
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

accuracy = [y == Yout];
correct = size(find(accuracy == 1));
finalPercentage = correct / size(X);

%definitely incorrect. does not use the test set, and tries to predict on training set.
%very low accuracy. but the actual algorithm makes sense.
%it is a start lol
disp(finalPercentage * 100);


                  
