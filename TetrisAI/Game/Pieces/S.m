#import "../Pieces.h"

@implementation S

- (void)spawn:(int[HEIGHT][WIDTH]) board {
    board[2][WIDTH / 2 + 1] = 3;
    board[2][WIDTH / 2] = 33;
    board[3][WIDTH / 2] = 3;
    board[3][WIDTH / 2 - 1] = 3;
}
//DONE
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y {
    if (step == 0 || step == 2) {
        board[anc_y - 1][anc_x - 1] = 3;
        board[anc_y][anc_x - 1] = 3;
        board[anc_y + 1][anc_x] = 3;
    }
    if (step == 1 || step == 3) {
        board[anc_y][anc_x + 1] = 3;
        board[anc_y + 1][anc_x] = 3;
        board[anc_y + 1][anc_x - 1] = 3;
    }

}

@end
