function PlotGaussianData = plotGaussian(X, y)

% Total amount of data vectors
N = size(X);
features = N(2);

% Separate data into respective classes
c1 = X(find(y==1), :);
c2 = X(find(y==2), :);
c3 = X(find(y==3), :);

for i=1:features
  histogram(c1(:,i), 'FaceAlpha', 0.5, 'FaceColor', 'r');
  hold on
  histogram(c2(:,i), 'FaceAlpha', 0.5, 'FaceColor', 'g');
  hold on
  histogram(c3(:,i), 'FaceAlpha', 0.5, 'FaceColor', 'y');
  hold off

  title(sprintf('Distribution of #%d Feature', i));
  xlabel(sprintf('Value of #%d Feature', i));
  ylabel(sprintf('Frequency of #%d Feature', i));
  pause;
end

end