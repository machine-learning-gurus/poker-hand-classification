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
