#include <gsl/gsl_rng.h>
#include "gsl-sprng.h"
#include <gsl/gsl_randist.h>
#include <mpi.h>

int main(int argc,char *argv[])
{
  int k,i,iters; double x,can,a,alpha; gsl_rng *r;
  FILE *s; char filename[15];
  MPI_Init(&argc,&argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&k);
  if ((argc != 3)) {
    if (k == 0)
      fprintf(stderr,"Usage: %s <iters> <alpha>\n",argv[0]);
    MPI_Finalize(); return(EXIT_FAILURE);
  }
  iters=atoi(argv[1]); alpha=atof(argv[2]);
  r=gsl_rng_alloc(gsl_rng_sprng20);
  sprintf(filename,"chain-%03d.tab",k);
  s=fopen(filename,"w");
  if (s==NULL) {
    perror("Failed open");
    MPI_Finalize(); return(EXIT_FAILURE);
  }
  x = gsl_ran_flat(r,-20,20);
  fprintf(s,"Iter X\n");
  for (i=0;i<iters;i++) {
    can = x + gsl_ran_flat(r,-alpha,alpha);
    a = gsl_ran_ugaussian_pdf(can) / gsl_ran_ugaussian_pdf(x);
    if (gsl_rng_uniform(r) < a)
      x = can;
    fprintf(s,"%d %f\n",i,x);
  }
  fclose(s);
  MPI_Finalize(); return(EXIT_SUCCESS);
}