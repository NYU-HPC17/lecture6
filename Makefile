CC=gcc-mp-6
FLAGS=-O3 -fopenmp -Wall
EXECS=jacobi-omp-bug pi-omg-bug

all: ${EXECS}

jacobi-omp-bug: jacobi-omp-bug.c
	${CC} ${FLAGS} $^ -o jacobi-omp-bug

pi-omp-bug: pi-omp-bug.c
	${CC} ${FLAGS} $^ -o pi-omp-bug

clean:
	rm -f ${EXECS}
