#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/*Bisection P1*/
double f(double x);
double bisection(double a, double b, double e, int* k);//e: error, k: calculation times
/*Iteration P2*/
double g1(double x);
double iteration(double x, double e, int* k);
/*Newton Method P3*/
double g2(double x);
double newton(double x, double e, int* k);

int main(int argc, char const *argv[])
{
    int k;
    FILE *fp = fopen("answer.txt", "wt+");

    printf("Problem 1: x_%d = %.5f\n", k, bisection(0, 1, 0.0005, &k));
    fprintf(fp ,"Problem 1: x_%d = %.5f\n", k, bisection(0, 1, 0.0005, &k));
    printf("Problem 2: x_%d = %.5f\n", k, iteration(0, 0.0005, &k));
    fprintf(fp, "Problem 2: x_%d = %.5f\n", k, iteration(0, 0.0005, &k));
    printf("Problem 3: x_%d = %.5f\n", k, newton(0, 0.0005, &k));
    fprintf(fp, "Problem 3: x_%d = %.5f\n", k, newton(0, 0.0005, &k));

    system("pause");
	return 0;
}

double f(double x)
{
	return exp(x) + 10 * x - 2;
}

double bisection(double a, double b, double e, int* k)
{
    *k = 0;
    double left = a, right = b;
    double x;
    double y;
    double y1 = f(a);
    double y2 = f(b);
    do
    {
        (*k) ++;
        x = (left + right) / 2; //Get mid-point
        y = f(x); //Get function value
        if(y1 * y < 0) //If y < 0
            right = x; //x* < x
        else
        {
            left = x; //x* > x
            y1 = y;
        }
    }while(right - left >= e); //When error exceeded, continue

    return x;
}

double g1(double x)
{
    return (2 - exp(x)) / 10;
}

double iteration(double x, double e, int* k)
{
    double x0 = x;
    double x1;
    *k = 1;
    for(; *k < 100; (*k) ++)
    {
        x1 = g1(x0); // x_k+1 = g(x_k)
        if(fabs(x1 - x0) < e)//When error not exceeded, return x1
            break;
        x0 = x1;
    }

    return x1;
}

double g2(double x)
{
    return x - (exp(x) + 10 * x - 2) / //f(x)
                (exp(x) + 10);//f'(x)
}

double newton(double x, double e, int* k)
{
    double x0 = x;
    double x1;
    *k = 1;
    for(; *k < 100; (*k) ++)
    {
        x1 = g2(x0); // x_k+1 = g(x_k)
        if(fabs(x1 - x0) < e)//When error not exceeded, return x1
            break;
        x0 = x1;
    }

    return x1;
}
