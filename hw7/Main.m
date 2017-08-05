res1 = Euler(1, 0.1);
res2 = EulerModified(1, 0.1);
res3 = RK(1, 0.1);
standardRes = Standard();
i = 1;
fp = fopen('answer.txt', 'w');
for x = 0:0.1:1
    fprintf('x = %.1f, Euler: %.6f, Euler Modified: %.6f, R-K: %.6f, Standard: %.8f\n', x, res1(i), res2(i), res3(i), standardRes(i));
    fprintf(fp, 'x = %.1f, Euler: %.6f, Euler Modified: %.6f, R-K: %.6f, Standard: %.8f\r\n', x, res1(i), res2(i), res3(i), standardRes(i));
    i = i + 1;
end
pause();