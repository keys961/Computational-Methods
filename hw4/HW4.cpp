#include <cstdio>
#include <cstdlib>
#include <cmath>

using namespace std;

int main()
{
    FILE *fp = fopen("Answer.txt", "w+");
    double y = 0;
    double xIn[12] = {2, 4, 6, 12, 16, 30, 60, 110, 180, 280,
                    400, 515};//input X
    double p = 1.86548, q = -0.046115; //左边以及右边一阶导数
    double a[19] = {0.52, 3.1, 8.0, 17.95, 28.65, 39.62,
            50.65, 78, 104.6, 156.6, 208.6, 260.7, 312.5,
            364.4, 416.3, 468, 494, 507, 520};//X
    double b[19] = {5.28794, 9.4, 13.84, 20.2, 24.9, 28.44,
            31.1, 35, 36.5, 36.6, 34.6, 31.0, 26.34, 20.9,
            14.8, 7.8, 3.7, 1.5, 0.2};//f(x)
    double h[19], s[19], t[19], g[19];
    double f[19], m[20], n[20];
    for(int i = 1; i < 19; i++)
        h[i] = a[i] - a[i - 1];//h
    for(int i = 1; i < 18; i++)
    {
        s[i] = h[i] / (h[i] + h[i + 1]);//lambda & micro
        t[i] = 1 - s[i];
    }
    for(int i = 1; i < 18; i++)//get g
        g[i] = 6 / (h[i] + h[i + 1]) *
            ((b[i + 1] - b[i])/h[i + 1] - (b[i] - b[i - 1])/h[i]);

    g[0] = 6 / h[1] * ((b[1] - b[0]) / h[1] - p);
    g[18] = 6 / h[18] * (q - (b[18] - b[17]) / h[18]);

    //solve by chasing
    f[1] = 0.5;
    for(int i = 2; i < 19; i++)
        f[i] = t[i - 1] / (2 - s[i - 1] * f[i - 1]);
    n[1] = g[0] / 2;
    for(int i = 2; i < 20; i++)
        n[i] = (g[i - 1] - s[i - 1] * n[i - 1])/
            (2 - s[i - 1] * f[i - 1]);
    m[19] = n[19];
    for(int i = 18; i > 0; i--)
        m[i] = n[i] - f[i] * m[i + 1];

    for(int i = 0; i < 12; i++)//chasing
    {
        int j;
        for(j = 0; a[j] < xIn[i]; j++);
        y = m[j] * (a[j] - xIn[i]) * (a[j] - xIn[i]) / h[j] / 6;
        y += m[j + 1] * (xIn[i] - a[j - 1]) * (xIn[i] - a[j - 1])
            * (xIn[i] - a[j - 1]) / h[j] / 6;
        y += (b[j - 1] - m[j]* h[j] * h[j] / 6) * (a[j] - xIn[i]) / h[j];
        y += (b[j] - m[j + 1] * h[j] * h[j] / 6) * (xIn[i] - a[j - 1]) / h[j];
        printf("f(%.1f) = %.4f\n", xIn[i], y);//output
        fprintf(fp, "f(%.1f) = %.4f\n", xIn[i], y);//to file
    }
    fclose(fp);
    system("pause");
    return 0;
}
