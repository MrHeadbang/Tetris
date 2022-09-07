#import "../Pieces.h"

@implementation I

- (void)spawn:(int[HEIGHT][WIDTH]) board {
    board[0][WIDTH / 2 - 1] = 2;
    board[1][WIDTH / 2 - 1] = 22;
    board[2][WIDTH / 2 - 1] = 2;
    board[3][WIDTH / 2 - 1] = 2;
}


//DONE
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y {
    
    if (step == 0 || step == 2) {
        board[anc_y][anc_x - 1] = 2;
        board[anc_y][anc_x + 1] = 2;
        board[anc_y][anc_x + 2] = 2;
    }
    if (step == 1 || step == 3) {
        board[anc_y - 1][anc_x] = 2;
        board[anc_y + 1][anc_x] = 2;
        board[anc_y + 2][anc_x] = 2;
    }
}

@end
