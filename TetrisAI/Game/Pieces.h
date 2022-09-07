#ifndef Pieces_h
#define Pieces_h


#endif /* Pieces_h */
#import <Foundation/Foundation.h>
#include "../Macros.h"


@interface Movement : NSObject
- (void)stepDown:(int[HEIGHT][WIDTH]) board;
- (void)removeMoving:(int[HEIGHT][WIDTH]) board;
- (BOOL)checkSpace:(int[HEIGHT][WIDTH]) board anchor_x:(int) anc_x anchor_y:(int) anc_y;
- (void)getAnchor:(int[HEIGHT][WIDTH]) board anchor_x_pointer:(int*) ptr_x anchor_y_pointer:(int*) ptr_y;
- (BOOL)collapseStepCheck:(int[HEIGHT][WIDTH]) board;
- (void)freezeMoving:(int[HEIGHT][WIDTH]) board;
- (void)spawnRandom:(int[HEIGHT][WIDTH]) board random:(int) random;
- (void)stepRight:(int[HEIGHT][WIDTH]) board;
- (void)stepLeft:(int[HEIGHT][WIDTH]) board;
- (BOOL)lineFull:(int[HEIGHT][WIDTH]) board line:(int) line;
- (void)removeLine:(int[HEIGHT][WIDTH]) board line:(int) line;
@end

@interface O : NSObject
- (void)spawn:(int[HEIGHT][WIDTH]) board;
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y;
@end


@interface L : NSObject
- (void)spawn:(int[HEIGHT][WIDTH]) board;
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y;
@end


@interface J : NSObject
- (void)spawn:(int[HEIGHT][WIDTH]) board;
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y;
@end


@interface S : NSObject
- (void)spawn:(int[HEIGHT][WIDTH]) board;
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y;
@end


@interface Z : NSObject
- (void)spawn:(int[HEIGHT][WIDTH]) board;
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y;
@end


@interface I : NSObject
- (void)spawn:(int[HEIGHT][WIDTH]) board;
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y;
@end


@interface T : NSObject
- (void)spawn:(int[HEIGHT][WIDTH]) board;
- (void)rotate:(int[HEIGHT][WIDTH]) board rotationStep:(int) step anchor_x:(int) anc_x anchor_y:(int) anc_y;
@end


