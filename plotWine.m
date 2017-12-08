function PlotGaussianData = plotGaussian(X, y)

% Total amount of data vectors
N = size(X);
dimension = N(2);

% Separate data into respective classes
c1 = X(find(y==1), :);
c2 = X(find(y==2), :);
c3 = X(find(y==3), :);

for i=1:dimension
  histogram(c1(:,i), 'FaceAlpha', 0.5, 'FaceColor', 'r', 'EdgeColor', 'none');
  hold on
  histogram(c2(:,i), 'FaceAlpha', 0.5, 'FaceColor', 'g', 'EdgeColor', 'none');
  hold on
  histogram(c3(:,i), 'FaceAlpha', 0.5, 'FaceColor', 'b', 'EdgeColor', 'none');
  hold off

  max_c1 = max(c1(:,i));
  max_c2 = max(c2(:,i));
  max_c3 = max(c3(:,i));
  maxVal = max([max_c1, max_c2, max_c3]);

  min_c1 = min(c1(:,i));
  min_c2 = min(c2(:,i));
  min_c3 = min(c3(:,i));
  minVal = min([min_c1, min_c2, min_c3]);

  % set(gca, 'Color', [50 56 62] ./ 255);
  % set(gca,'xcolor','w');
  % set(gca,'ycolor','w');
  title(sprintf('Distribution of #%d Feature', i), 'Color', 'k', 'FontWeight', 'normal');
  xlabel(sprintf('Value of #%d Feature', i), 'Color', 'k', 'FontWeight', 'normal');
  ylabel(sprintf('Frequency of #%d Feature', i), 'Color', 'k', 'FontWeight', 'normal');
  xlim([minVal - (abs(minVal) * .2), maxVal + (maxVal * .2)]);
  pause;
end

end