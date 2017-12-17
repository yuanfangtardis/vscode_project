#include <gsl/gsl_rng.h>
#include <gsl/gsl_randist.h>

int main(void)
{
  int i; double z; gsl_rng *r;
  r = gsl_rng_alloc(gsl_rng_mt19937);
  gsl_rng_set(r,0);
  for (i=0;i<10;i++) {
    z = gsl_ran_gaussian(r,1.0);
    printf("z(%d) = %f\n",i,z);
  }
  exit(EXIT_SUCCESS);
}