#import "../Pieces.h"

@implementation Z

- (void)spawn:(int[HEIGHT][WIDTH]) board {
    board[2][WIDTH / 2 - 2] = 4;
    board[2][WIDTH / 2 - 1] = 44;
    board[3][WIDTH / 2] = 4;
    board[3][WIDTH / 2 - 1] = 4;
}
//DONE
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y {
    if (step == 0 || step == 2) {
        board[anc_y + 1][anc_x] = 4;
        board[anc_y][anc_x + 1] = 4;
        board[anc_y - 1][anc_x + 1] = 4;
    }
    if (step == 1 || step == 3) {
        board[anc_y][anc_x - 1] = 4;
        board[anc_y + 1][anc_x] = 4;
        board[anc_y + 1][anc_x + 1] = 4;
    }
}

@end
