#import "Pieces.h"

@implementation Movement

- (void)stepDown:(int[HEIGHT][WIDTH]) board {
    int board_copy[HEIGHT][WIDTH];
    memset(board_copy, 0x00, HEIGHT * WIDTH * sizeof(int));
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            int element = board[i][j];
            if (element < 100 && element != 0) {
                board_copy[i + 1][j] = element;
            }
            if (element > 100) {
                board_copy[i][j] = element;
            }
        }
    }
    memcpy(board, board_copy, WIDTH * HEIGHT * sizeof(int));
}

- (void)removeMoving:(int[HEIGHT][WIDTH]) board {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            int element = board[i][j];
            if (element > 0 && element < 10) {
                board[i][j] = 0;
            }
        }
    }
}

- (BOOL)checkSpace:(int[HEIGHT][WIDTH]) board anchor_x:(int) anc_y anchor_y:(int) anc_x {
    //Left / Right Check
    if (anc_x < 1 || anc_x > WIDTH - 1) {
        return false;
    }
    //Up / Down Check
    if (anc_y < 1 || anc_y > HEIGHT - 1) {
        return false;
    }
    //Check 3x3 with anchor in center
    for (int i = anc_y - 1; i <= anc_y + 1; i++) {
        for (int j = anc_x - 1; j <= anc_x + 1; j++) {
            //BOOL isCenter = (i == anc_y && j == anc_x);
            if (board[i][j] > 100/* && !isCenter*/) {
                return false;
            }
        }
    }
    return true;
}
- (void)getAnchor:(int[HEIGHT][WIDTH]) board anchor_x_pointer:(int*) ptr_x anchor_y_pointer:(int*) ptr_y {
    BOOL breaker = false;
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            int element = board[i][j];
            if (element > 9 && element < 100) {
                *ptr_x = j;
                *ptr_y = i;
                breaker = true;
                break;
            }
        }
        if (breaker) {
            break;
        }
    }
}

- (BOOL)collapseStepCheck:(int[HEIGHT][WIDTH]) board {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            int element = board[i][j];
            if (element < 100 && element != 0) {
                //Bottom Check
                if (i == HEIGHT - 1) {
                    return true;
                }
                //Other piece check except same piece
                if (board[i + 1][j] > 100) {
                    return true;
                }
            }
        }
    }
    return false;
}
- (void)freezeMoving:(int[HEIGHT][WIDTH]) board {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            int element = board[i][j];
            if (element < 100) {
                board[i][j] = (element % 10) * 111;
            }
        }
    }
}
- (void)spawnRandom:(int[HEIGHT][WIDTH]) board random:(int) random{
    O *o = [[O alloc] init];
    L *l = [[L alloc] init];
    J *j = [[J alloc] init];
    I *i = [[I alloc] init];
    S *s = [[S alloc] init];
    Z *z = [[Z alloc] init];
    T *t = [[T alloc] init];
    switch (random) {
        case 1:
            [o spawn:board];
            break;
        case 2:
            [i spawn:board];
            break;
        case 3:
            [s spawn:board];
            break;
        case 4:
            [z spawn:board];
            break;
        case 5:
            [l spawn:board];
            break;
        case 6:
            [j spawn:board];
            break;
        case 7:
            [t spawn:board];
            break;
        default:
            break;
    }
}

- (void)stepRight:(int[HEIGHT][WIDTH]) board {
    int board_copy[HEIGHT][WIDTH];
    memset(board_copy, 0x00, HEIGHT * WIDTH * sizeof(int));
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            int element = board[i][j];
            if (element < 100 && element != 0) {
                //Right border check
                if (j == WIDTH - 1) {
                    return;
                }
                //Right piece check
                if (board[i][j + 1] > 100/* && board[i][j + 1] % 10 != element % 10*/) {
                    return;
                }
                board_copy[i][j + 1] = element;
            } else if (element > 100) {
                board_copy[i][j] = element;
            }
        }
    }
    memcpy(board, board_copy, HEIGHT * WIDTH * sizeof(int));
}
- (void)stepLeft:(int[HEIGHT][WIDTH]) board {
    int board_copy[HEIGHT][WIDTH];
    memset(board_copy, 0x00, HEIGHT * WIDTH * sizeof(int));
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            int element = board[i][j];
            if (element < 100 && element != 0) {
                //Left border check
                if (j == 0) {
                    return;
                }
                //Left piece check
                if (board[i][j - 1] > 100 /*&& board[i][j - 1] % 10 != element % 10*/) {
                    return;
                }
                board_copy[i][j - 1] = element;
            } else if (element > 100) {
                board_copy[i][j] = element;
            }
        }
    }
    memcpy(board, board_copy, HEIGHT * WIDTH * sizeof(int));
}


- (void)removeLine:(int[HEIGHT][WIDTH]) board line:(int) line {
    int board_copy[HEIGHT][WIDTH];
    memset(board_copy, 0x00, HEIGHT * WIDTH * sizeof(int));
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            if (i < line) {
                board_copy[i + 1][j] = board[i][j];
            }
            if (i > line) {
                board_copy[i][j] = board[i][j];
            }
        }
    }
    memcpy(board, board_copy, HEIGHT * WIDTH * sizeof(int));
}

- (BOOL)lineFull:(int[HEIGHT][WIDTH]) board line:(int) line {
    for (int i = 0; i < WIDTH; i++) {
        if (board[line][i] == 0) {
            return false;
        }
    }
    return true;
}

@end
