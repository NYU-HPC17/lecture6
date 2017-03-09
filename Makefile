CC=gcc-mp-6
FLAGS=-O3 -fopenmp -Wall
EXECS=jacobi-omp-bug pi-omp-bug val-test1 val-test2

all: ${EXECS}

jacobi-omp-bug: jacobi-omp-bug.c
	${CC} ${FLAGS} $^ -o jacobi-omp-bug

pi-omp-bug: pi-omp-bug.c
	${CC} ${FLAGS} $^ -o pi-omp-bug

val-test1: val-test1.c
	${CC} ${FLAGS} $^ -o val-test1

clean:
	rm -f ${EXECS}
