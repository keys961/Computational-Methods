X = [1 3 4 5 6 7 8 9 10];
Y = [10 5 4 2 1 1 2 3 4];
[coffs, minPos] = fitting(X, Y);
fid = fopen('answer.txt', 'wt');
fprintf(fid, 'f(x) = %f + %f * x + %f * x^2\n', coffs(1), coffs(2), coffs(3));
fprintf('f(x) = %f + %f * x + %f * x^2\n', coffs(1), coffs(2), coffs(3));
fprintf(fid, 'Min position:(%f, %f)\n', minPos(1), minPos(2));
fprintf('Min position:(%f, %f)\n', minPos(1), minPos(2));