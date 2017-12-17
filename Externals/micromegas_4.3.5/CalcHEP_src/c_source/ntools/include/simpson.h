#ifndef  __SIMPSON__
#define  __SIMPSON__
extern double gauss( double (*func)(double),double a,double b, int n);
extern double gauss345(double (*func)(double), double a, double b, double eps,int * err_code);
extern double gauss_arg( double (*func)(double,void*par),void*par,double a,double b, int n);

extern int simpson_err;
extern double simpson( double (*func)(double),double a,double b, double  eps);
extern double simpson_arg( double (*func)(double,void*par), void*par,double a,double b,double  eps);

#endif
