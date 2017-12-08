function PlotGaussianData = plotGaussian(X, y)

% Total amount of data vectors
N = size(X);
dimension = N(2);

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

for i=1:dimension
  histogram(c0(:,i), 'FaceAlpha', 0.3, 'FaceColor', 'r', 'EdgeColor', 'none');
  hold on
  histogram(c1(:,i), 'FaceAlpha', 0.3, 'FaceColor', 'y', 'EdgeColor', 'none');
  hold on
  histogram(c2(:,i), 'FaceAlpha', 0.3, 'FaceColor', 'g', 'EdgeColor', 'none');
  hold on
  histogram(c3(:,i), 'FaceAlpha', 0.3, 'FaceColor', 'b', 'EdgeColor', 'none');
  hold on
  histogram(c4(:,i), 'FaceAlpha', 0.3, 'FaceColor', 'k', 'EdgeColor', 'none');
  hold on
  histogram(c5(:,i), 'FaceAlpha', 0.3, 'FaceColor', 'c', 'EdgeColor', 'none');
  hold on
  histogram(c6(:,i), 'FaceAlpha', 0.3, 'FaceColor', 'm', 'EdgeColor', 'none');
  hold on
  histogram(c7(:,i), 'FaceAlpha', 0.3, 'FaceColor', [1 .4 .6], 'EdgeColor', 'none');
  hold on
  histogram(c8(:,i), 'FaceAlpha', 0.3, 'FaceColor', [.5 .5 .5], 'EdgeColor', 'none');
  hold on
  histogram(c9(:,i), 'FaceAlpha', 0.3, 'FaceColor', [.7 .7 .7], 'EdgeColor', 'none');
  hold off
  
  % set(gca, 'Color', [50 56 62] ./ 255);
  % set(gca,'xcolor','w');
  % set(gca,'ycolor','w');
  title(sprintf('Distribution of #%d Feature', i), 'Color', 'k', 'FontWeight', 'normal');
  xlabel(sprintf('Value of #%d Feature', i), 'Color', 'k', 'FontWeight', 'normal');
  ylabel(sprintf('Frequency of #%d Feature', i), 'Color', 'k', 'FontWeight', 'normal');
  legend({'High Card', 'One Pair', 'Two Pair', 'Three of a Kind', 'Straight', 'Full House', 'Four of a Kind', 'Straight Flush', 'Royal Flush'}, 'FontWeight', 'normal', 'TextColor', 'k');
  % xlim([1 13]);
  legend('Location', 'northeastoutside');
  legend boxoff;
  pause;
end

end