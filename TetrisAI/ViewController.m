#import "ViewController.h"

@implementation ViewController

- (NSColor*)colorWithHexColorString:(NSString*)inColorString {
    NSColor* result = nil;
    unsigned colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    if (nil != inColorString) {
         NSScanner* scanner = [NSScanner scannerWithString:inColorString];
         (void) [scanner scanHexInt:&colorCode];
    }
    redByte = (unsigned char)(colorCode >> 16);
    greenByte = (unsigned char)(colorCode >> 8);
    blueByte = (unsigned char)(colorCode);
    result = [NSColor
    colorWithCalibratedRed:(CGFloat)redByte / 0xff
    green:(CGFloat)greenByte / 0xff
    blue:(CGFloat)blueByte / 0xff
    alpha:1.0];
    return result;
}


- (void)drawSquare:(NSInteger) pos_x positionY:(NSInteger) pos_y squareSize:(NSInteger) size squareColor:(NSColor*) color {
    NSView *rectView = [[NSView alloc] initWithFrame:CGRectMake(pos_x, pos_y, size, size)];
    [rectView setWantsLayer:YES];
    [rectView.layer setBackgroundColor:[color CGColor]];
    [rectView.layer setBorderColor:[[NSColor whiteColor] CGColor]];
    [rectView.layer setBorderWidth:0.8];
    [self.view addSubview:rectView];
}
- (void)drawBoard:(int[HEIGHT][WIDTH]) board squareSize:(NSInteger) size {
    NSString *pieceColors[8] = {@"000000", @"FFFF00", @"0000FF", @"FF0000", @"FF00FF", @"FFAA01", @"00FF00", @"00FFFF"};
    //[self.view setSubviews:[NSArray array]];
    for (int i = HEIGHT - 1; /*i >= 4*/ i >= 0; i--) {
        for (int j = 0; j < WIDTH; j++) {
            int element = board[i][j] % 10;
            NSLog(@"%d\n", element);
            NSColor *color = [self colorWithHexColorString:pieceColors[element]];
            [self drawSquare: size * j  positionY:size * (HEIGHT - i - 1) squareSize:size squareColor:color];
        }
    }
}
int Board[HEIGHT][WIDTH];
int rotation_step = 0;
int current_piece = 0;
- (void)timerAction: (NSTimer *)timer {
    
    
    
    Movement *movement = [[Movement alloc] init];
    if ([movement collapseStepCheck:Board]) {
        [movement freezeMoving:Board];
        int lowerBound = 1;
        int upperBound = 7;
        int random = lowerBound + arc4random() % (upperBound - lowerBound);
        current_piece = random;
        rotation_step = 0;
        
        for (int i = 0; i < HEIGHT; i++) {
            if ([movement lineFull:Board line:i]) {
                [movement removeLine:Board line:i];
                [self drawBoard:Board squareSize:SQUARE_SIZE];
            }
        }
        
        [movement spawnRandom:Board random:random];
    } else {
        [movement stepDown:Board];
        [self drawBoard:Board squareSize:SQUARE_SIZE];
    }
}

- (void)board_rotate {
    
    Movement *movement = [[Movement alloc] init];
    int anc_x;
    int anc_y;
    [movement getAnchor:Board anchor_x_pointer:&anc_x anchor_y_pointer:&anc_y];
    
    O *o = [[O alloc] init];
    L *l = [[L alloc] init];
    J *j = [[J alloc] init];
    I *i = [[I alloc] init];
    S *s = [[S alloc] init];
    Z *z = [[Z alloc] init];
    T *t = [[T alloc] init];
    
    
    [movement removeMoving:Board];
    
    switch (current_piece) {
        case 1:
            
            [o rotate:Board rotationStep:rotation_step anchor_x:anc_x anchor_y:anc_y];
            break;
        case 2:
            [i rotate:Board rotationStep:rotation_step anchor_x:anc_x anchor_y:anc_y];
            break;
        case 3:
     
            [s rotate:Board rotationStep:rotation_step anchor_x:anc_x anchor_y:anc_y];
            break;
        case 4:
        
            [z rotate:Board rotationStep:rotation_step anchor_x:anc_x anchor_y:anc_y];
            break;
        case 5:
     
            [l rotate:Board rotationStep:rotation_step anchor_x:anc_x anchor_y:anc_y];
            break;
        case 6:
       
            [j rotate:Board rotationStep:rotation_step anchor_x:anc_x anchor_y:anc_y];
            break;
        case 7:
    
            [t rotate:Board rotationStep:rotation_step anchor_x:anc_x anchor_y:anc_y];
            break;
        default:
            break;
    }
    
    rotation_step++;
    rotation_step %= 4;
    [self drawBoard:Board squareSize:SQUARE_SIZE];
}

- (void)board_left {
    Movement *movement = [[Movement alloc] init];
    [movement stepLeft:Board];
    [self drawBoard:Board squareSize:SQUARE_SIZE];
}

- (void) board_right {
    Movement *movement = [[Movement alloc] init];
    [movement stepRight:Board];
    [self drawBoard:Board squareSize:SQUARE_SIZE];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSRect f = self.view.frame;
    f.size.width = WIDTH * SQUARE_SIZE + 200;
    f.size.height = (HEIGHT /*-4*/) * SQUARE_SIZE;
    self.view.frame = f;
    
    NSButton *rotate = [[NSButton alloc] initWithFrame:NSMakeRect(WIDTH * SQUARE_SIZE + 10, 200, 180, 70)];
    
    [rotate setTitle: @"Rotate"];
    [rotate setTarget:self];
    [rotate setAction:@selector(board_rotate)];
    [self.view addSubview:rotate];
    
    NSButton *left = [[NSButton alloc] initWithFrame:NSMakeRect(WIDTH * SQUARE_SIZE + 10, 280, 85, 70)];
    [left setTitle: @"Left"];
    [left setTarget:self];
    [left setAction:@selector(board_left)];
    [self.view addSubview:left];
    
    NSButton *right = [[NSButton alloc] initWithFrame:NSMakeRect(WIDTH * SQUARE_SIZE + 10 + 95, 280, 85, 70)];
    [right setTitle: @"Right"];
    [right setTarget:self];
    [right setAction:@selector(board_right)];
    [self.view addSubview:right];
    

    
    memset(Board, 0x00, WIDTH * HEIGHT * sizeof(int));
    /*
    
    J *c = [[J alloc] init];
    [c spawn:Board];*/
    Movement *movement = [[Movement alloc] init];
    int lowerBound = 1;
    int upperBound = 7;
    int random = lowerBound + arc4random() % (upperBound - lowerBound);
    current_piece = random;
    [movement spawnRandom:Board random:random];
    
    [self drawBoard:Board squareSize:SQUARE_SIZE];


    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}


@end
