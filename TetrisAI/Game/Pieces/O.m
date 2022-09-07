#import "../Pieces.h"

@implementation O

- (void)spawn:(int[HEIGHT][WIDTH]) board {
    board[2][WIDTH / 2] = 1;
    board[2][WIDTH / 2 - 1] = 11;
    board[3][WIDTH / 2] = 1;
    board[3][WIDTH / 2 - 1] = 1;
}
//DONE
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y {
    if (step == 0 || step == 1 || step == 2 || step == 3) {
        board[anc_y + 1][anc_x] = 1;
        board[anc_y + 1][anc_x + 1] = 1;
        board[anc_y][anc_x + 1] = 1;
    }
}

@end
