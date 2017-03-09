/*
 * OpenMP Example based on code in Tim Mattson's Tutorial
 *
 * [slides](http://openmp.org/mp-documents/Intro_To_OpenMP_Mattson.pdf)
 * [video](http://goo.gl/EaxWjY)
 *
 */
#include <omp.h>

#define N 1024

int main()
{
  int i;
  double a[N], b[N];

  /*
   * Sequential Code
   */
  for(i=0;i<N;++i)
  {
    a[i] = a[i] + b[i];
  }


  /*
   * omp work sharing
   */
#pragma omp parallel
  {
    int id, i, Nthrds, istart, iend;
    id = omp_get_thread_num();
    Nthrds = omp_get_num_threads();
    istart = id * N / Nthrds;
    iend = (id+1) * N / Nthrds;
    if (id == Nthrds-1)
      iend = N;
    for(i=istart;i<iend;++i)
    {
      a[i] = a[i] + b[i];
    }
  }

  /*
   * omp syntactic sugar
   */
#pragma omp parallel
#pragma omp for
  for(i=0;i<N;++i)
  {
    a[i] = a[i] + b[i];
  }

  /*
   * even shorter omp syntactic sugar
   */
#pragma omp parallel for
  for(i=0;i<N;++i)
  {
    a[i] = a[i] + b[i];
  }

  /*
   * static deal out blocks of size 8 to each thread
   * done at compile time
   */
#pragma omp parallel for schedule(static,8)
  for(i=0;i<N;++i)
  {
    a[i] = a[i] + b[i];
  }

  /*
   * each thread will grab a block of 8 iteration until
   * all the iterations have been finished.
   * done at runtime; generated overhead but great if iterations
   * take different times to complete
   */
#pragma omp parallel for schedule(dynamic,8)
  for(i=0;i<N;++i)
  {
    a[i] = a[i] + b[i];
  }

  return 0;
}
