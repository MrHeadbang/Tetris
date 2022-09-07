#import "../Pieces.h"

@implementation L

- (void)spawn:(int[HEIGHT][WIDTH]) board {
    board[1][WIDTH / 2 - 1] = 5;
    board[2][WIDTH / 2 - 1] = 55;
    board[3][WIDTH / 2 - 1] = 5;
    board[3][WIDTH / 2] = 5;
}
//DONE
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y {
    if (step == 0) {
        board[anc_y][anc_x - 1] = 5;
        board[anc_y][anc_x + 1] = 5;
        board[anc_y + 1][anc_x - 1] = 5;
    }
    if (step == 1) {
        board[anc_y - 1][anc_x] = 5;
        board[anc_y + 1][anc_x] = 5;
        board[anc_y - 1][anc_x - 1] = 5;
    }
    if (step == 2) {
        board[anc_y][anc_x - 1] = 5;
        board[anc_y][anc_x + 1] = 5;
        board[anc_y - 1][anc_x + 1] = 5;
    }
    if (step == 3) {
        board[anc_y - 1][anc_x] = 5;
        board[anc_y + 1][anc_x] = 5;
        board[anc_y + 1][anc_x + 1] = 5;
    }
}

@end
