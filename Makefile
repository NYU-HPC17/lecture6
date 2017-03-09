CC=gcc-mp-6
FLAGS=-O3 -fopenmp -Wall -g
EXECS=jacobi-omp-bug pi-omp-bug val-test1 val-test2 broken broken_valgrind

all: ${EXECS}

jacobi-omp-bug: jacobi-omp-bug.c
	${CC} ${FLAGS} $^ -o jacobi-omp-bug

pi-omp-bug: pi-omp-bug.c
	${CC} ${FLAGS} $^ -o pi-omp-bug

broken: broken.c
	${CC} ${FLAGS} $^ -o broken

val-test1: val-test1.c
	${CC} ${FLAGS} $^ -o val-test1

val-test2: val-test2.c
	${CC} ${FLAGS} $^ -o val-test2

broken_valgrind: broken_valgrind.c
	${CC} ${FLAGS} $^ -o broken_valgrind

clean:
	rm -f ${EXECS}
