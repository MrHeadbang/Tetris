#import "../Pieces.h"

@implementation T

- (void)spawn:(int[HEIGHT][WIDTH]) board {
    board[2][WIDTH / 2] = 7;
    board[2][WIDTH / 2 - 1] = 77;
    board[1][WIDTH / 2 - 1] = 7;
    board[3][WIDTH / 2 - 1] = 7;
}
//DONE
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y {
    if (step == 0) {
        board[anc_y - 1][anc_x] = 7;
        board[anc_y + 1][anc_x] = 7;
        board[anc_y][anc_x + 1] = 7;
    }
    if (step == 1) {
        board[anc_y][anc_x - 1] = 7;
        board[anc_y][anc_x + 1] = 7;
        board[anc_y + 1][anc_x] = 7;
    }
    if (step == 2) {
        board[anc_y - 1][anc_x] = 7;
        board[anc_y + 1][anc_x] = 7;
        board[anc_y][anc_x - 1] = 7;
    }
    if (step == 3) {
        board[anc_y][anc_x - 1] = 7;
        board[anc_y][anc_x + 1] = 7;
        board[anc_y - 1][anc_x] = 7;
    }
}

@end
