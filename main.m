data = dlmread("data/poker-hand-training-true.data",",");
y = data(:,end);
X = data(:,1:end-1);

c0 = [];
c1 = [];
c2 = [];
c3 = [];
c4 = [];
c5 = [];
c6 = [];
c7 = [];
c8 = [];
c9 = [];

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

%compute the covariances and means (we need to do that for something im pretty sure)

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

means = [c0mean; c1mean; c2mean; c3mean; c4mean; c5mean; c6mean; c7mean; c8mean; c9mean];

meanOfMeans = mean(means);

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

