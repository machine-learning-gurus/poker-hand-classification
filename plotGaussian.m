function PlotGaussianData = plotGaussian(X, y)

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

% 0: Nothing in hand; not a recognized poker hand 
c0_cards1 = [c0(:,1), c0(:,2)];
c0_cards2 = [c0(:,3), c0(:,4)];
c0_cards3 = [c0(:,5), c0(:,6)];
c0_cards4 = [c0(:,7), c0(:,8)];
c0_cards5 = [c0(:,9), c0(:,10)];
c0_cards = [c0_cards1; c0_cards2; c0_cards3; c0_cards4; c0_cards5];
c0_cards_normalized = [((c0_cards(:, 1) - 1) * 13) + c0_cards(:, 2)];

% 1: One pair; one pair of equal ranks within five cards
c1_cards1 = [c1(:,1), c1(:,2)];
c1_cards2 = [c1(:,3), c1(:,4)];
c1_cards3 = [c1(:,5), c1(:,6)];
c1_cards4 = [c1(:,7), c1(:,8)];
c1_cards5 = [c1(:,9), c1(:,10)];
c1_cards = [c1_cards1; c1_cards2; c1_cards3; c1_cards4; c1_cards5];
c1_cards_normalized = [((c1_cards(:, 1) - 1) * 13) + c1_cards(:, 2)];

% 2: Two pairs; two pairs of equal ranks within five cards
c2_cards1 = [c2(:,1), c2(:,2)];
c2_cards2 = [c2(:,3), c2(:,4)];
c2_cards3 = [c2(:,5), c2(:,6)];
c2_cards4 = [c2(:,7), c2(:,8)];
c2_cards5 = [c2(:,9), c2(:,10)];
c2_cards = [c2_cards1; c2_cards2; c2_cards3; c2_cards4; c2_cards5];
c2_cards_normalized = [((c2_cards(:, 1) - 1) * 13) + c2_cards(:, 2)];

% 3: Three of a kind; three equal ranks within five cards
c3_cards1 = [c3(:,1), c3(:,2)];
c3_cards2 = [c3(:,3), c3(:,4)];
c3_cards3 = [c3(:,5), c3(:,6)];
c3_cards4 = [c3(:,7), c3(:,8)];
c3_cards5 = [c3(:,9), c3(:,10)];
c3_cards = [c3_cards1; c3_cards2; c3_cards3; c3_cards4; c3_cards5];
c3_cards_normalized = [((c3_cards(:, 1) - 1) * 13) + c3_cards(:, 2)];

% 4: Straight; five cards, sequentially ranked with no gaps
c4_cards1 = [c4(:,1), c4(:,2)];
c4_cards2 = [c4(:,3), c4(:,4)];
c4_cards3 = [c4(:,5), c4(:,6)];
c4_cards4 = [c4(:,7), c4(:,8)];
c4_cards5 = [c4(:,9), c4(:,10)];
c4_cards = [c4_cards1; c4_cards2; c4_cards3; c4_cards4; c4_cards5];
c4_cards_normalized = [((c4_cards(:, 1) - 1) * 13) + c4_cards(:, 2)];

% 5: Flush; five cards with the same suit
c5_cards1 = [c5(:,1), c5(:,2)];
c5_cards2 = [c5(:,3), c5(:,4)];
c5_cards3 = [c5(:,5), c5(:,6)];
c5_cards4 = [c5(:,7), c5(:,8)];
c5_cards5 = [c5(:,9), c5(:,10)];
c5_cards = [c5_cards1; c5_cards2; c5_cards3; c5_cards4; c5_cards5];
c5_cards_normalized = [((c5_cards(:, 1) - 1) * 13) + c5_cards(:, 2)];

% 6: Full house; pair + different rank three of a kind
c6_cards1 = [c6(:,1), c6(:,2)];
c6_cards2 = [c6(:,3), c6(:,4)];
c6_cards3 = [c6(:,5), c6(:,6)];
c6_cards4 = [c6(:,7), c6(:,8)];
c6_cards5 = [c6(:,9), c6(:,10)];
c6_cards = [c6_cards1; c6_cards2; c6_cards3; c6_cards4; c6_cards5];
c6_cards_normalized = [((c6_cards(:, 1) - 1) * 13) + c6_cards(:, 2)];

% 7: Four of a kind; four equal ranks within five cards
c7_cards1 = [c7(:,1), c7(:,2)];
c7_cards2 = [c7(:,3), c7(:,4)];
c7_cards3 = [c7(:,5), c7(:,6)];
c7_cards4 = [c7(:,7), c7(:,8)];
c7_cards5 = [c7(:,9), c7(:,10)];
c7_cards = [c7_cards1; c7_cards2; c7_cards3; c7_cards4; c7_cards5];
c7_cards_normalized = [((c7_cards(:, 1) - 1) * 13) + c7_cards(:, 2)];

% 8: Straight flush; straight + flush
c8_cards1 = [c8(:,1), c8(:,2)];
c8_cards2 = [c8(:,3), c8(:,4)];
c8_cards3 = [c8(:,5), c8(:,6)];
c8_cards4 = [c8(:,7), c8(:,8)];
c8_cards5 = [c8(:,9), c8(:,10)];
c8_cards = [c8_cards1; c8_cards2; c8_cards3; c8_cards4; c8_cards5];
c8_cards_normalized = [((c8_cards(:, 1) - 1) * 13) + c8_cards(:, 2)];

% 9: Royal flush; {Ace, King, Queen, Jack, Ten} + flush
c9_cards1 = [c9(:,1), c9(:,2)];
c9_cards2 = [c9(:,3), c9(:,4)];
c9_cards3 = [c9(:,5), c9(:,6)];
c9_cards4 = [c9(:,7), c9(:,8)];
c9_cards5 = [c9(:,9), c9(:,10)];
c9_cards = [c9_cards1; c9_cards2; c9_cards3; c9_cards4; c9_cards5];
c9_cards_normalized = [((c9_cards(:, 1) - 1) * 13) + c9_cards(:, 2)];

histogram(c0_cards1(:, 2), 'FaceAlpha', 0.25, 'FaceColor', rand(1,3));
hold on
histogram(c1_cards1(:, 2), 'FaceAlpha', 0.25, 'FaceColor', rand(1,3));
hold on
histogram(c2_cards1(:, 2), 'FaceAlpha', 0.25, 'FaceColor', rand(1,3));
hold on
histogram(c3_cards1(:, 2), 'FaceAlpha', 0.25, 'FaceColor', rand(1,3));
hold on
histogram(c4_cards1(:, 2), 'FaceAlpha', 0.25, 'FaceColor', rand(1,3));
hold on
histogram(c5_cards1(:, 2), 'FaceAlpha', 0.25, 'FaceColor', rand(1,3));
hold on
histogram(c6_cards1(:, 2), 'FaceAlpha', 0.25, 'FaceColor', rand(1,3));
hold on
histogram(c7_cards1(:, 2), 'FaceAlpha', 0.25, 'FaceColor', rand(1,3));
hold on
histogram(c8_cards1(:, 2), 'FaceAlpha', 0.25, 'FaceColor', rand(1,3));
hold on
histogram(c9_cards1(:, 2), 'FaceAlpha', 0.25, 'FaceColor', rand(1,3));
hold off

title('Distribution of 3rd Card in Hand Value within a Poker Hand');
xlabel('Value from 3rd Card in Hand');
ylabel('Frequency of Cards');
legend('High Card', 'One Pair', 'Two Pair', 'Three of a Kind', 'Straight', 'Full House', 'Four of a Kind', 'Straight Flush', 'Royal Flush');
xlim([1 13]);
legend('Location', 'northeastoutside');
legend boxoff;

end