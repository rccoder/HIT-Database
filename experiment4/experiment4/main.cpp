/*
* main.c
* Shangbin Yang
* Harbin Institute of Technology
* 5 26, 2016
* https://github.com/rccoder
*/

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "extmem.h"

#define R_DISK 111111111
#define S_DISK 222222222

#define BLOCK_SIZE 64
#define BUF_SIZE 520

#define R_ROW 16
#define R_COL 7
#define S_ROW 32
#define S_COL 7

typedef struct R {
	int A;
	int B;
} R;

typedef struct S {
	int C;
	int D;
} S;

R buildRandomR() {
	R newR;
	newR.A = rand() % 40 + 1;			// [1, 40]
	newR.B = rand() % 100 + 1;			// [1, 100]
	return newR;
}

S buildRandomS() {
	S newS;
	newS.C = rand() % 41 + 20;			// [20, 60]
	newS.D = rand() % 1000 + 1;			// [1, 1000]
	return newS;
}

void buildR(R * blkR, Buffer * buf) {
	for (int i = 0; i < R_ROW; i++) {
		blkR = (R *)getNewBlockInBuffer(buf);
		for (int j = 0; j < R_COL; j++) {
			*(blkR + j) = buildRandomR();
		}
	}
}

void buildS(S * blkS, Buffer * buf){
	for (int i = 0; i < S_ROW; i++) {
		blkS = (S *)getNewBlockInBuffer(buf);
		for (int j = 0; j < S_COL; j++) {
			*(blkS + j) = buildRandomS();
		}
	}
}
int main(int argc, char **argv) {
	Buffer buf;

	R * blkR;
	S * blkS;

	srand((unsigned int)(time(0)));

	if (!initBuffer(BUF_SIZE, BLOCK_SIZE, &buf)) {
		perror("Buffer Initialization Failed!\n");
		return -1;
	}

	buildR(blkR, &buf);
	buildS(blkS, &buf);

	/*
	for (int i = 0; i < R_ROW; i++) {
		blkR = (R *)getNewBlockInBuffer(&buf);
		for (int j = 0; j < R_COL; j++) {
			*(blkR + j) = buildRandomR();
		}
	}

	for (int i = 0; i < S_ROW; i++) {
		blkS = (S *)getNewBlockInBuffer(&buf);
		for (int j = 0; j < S_COL; j++) {
			*(blkS + j) = buildRandomS();
		}
	}
	*/

}