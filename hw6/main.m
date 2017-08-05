ans = Romberg( 0, 2*pi, 0.0001, 20);
fid = fopen('answer.txt','w');
fprintf(fid, 'The length of the eclipse is %f\n', ans);
disp('The result is in answer.txt');
pause();