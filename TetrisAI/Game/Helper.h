#ifndef Helper_h
#define Helper_h


#endif /* Helper_h */
#include <stdio.h>
void printBoard(int *board) {
  for (int i = 0; i < 10 * 24; i++) {
    printf("%d", *(board + i));
    if (i && i % 10 == 10 - 1) {
      printf("\n");
    }
    if (i == 4 * 10 - 1) {
      printf("----------\n");
    }
  }
}
