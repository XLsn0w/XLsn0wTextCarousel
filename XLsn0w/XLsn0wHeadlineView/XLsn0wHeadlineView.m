/*********************************************************************************************
 *   __      __   _         _________     _ _     _    _________   __         _         __   *
 *	 \ \    / /  | |        | _______|   | | \   | |  |  ______ |  \ \       / \       / /   *
 *	  \ \  / /   | |        | |          | |\ \  | |  | |     | |   \ \     / \ \     / /    *
 *     \ \/ /    | |        | |______    | | \ \ | |  | |     | |    \ \   / / \ \   / /     *
 *     /\/\/\    | |        |_______ |   | |  \ \| |  | |     | |     \ \ / /   \ \ / /      *
 *    / /  \ \   | |______   ______| |   | |   \ \ |  | |_____| |      \ \ /     \ \ /       *
 *   /_/    \_\  |________| |________|   |_|    \__|  |_________|       \_/       \_/        *
 *                                                                                           *
 *********************************************************************************************/

#import "XLsn0wHeadlineView.h"

#import "Masonry.h"

@implementation ItemObject

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"";
        self.detail = @"";
        self.title1 = @"";
        self.detail1 = @"";
    }
    return self;
}

@end

@implementation HintView

- (void)setItem:(ItemObject *)item {
    _item = item;
}

- (void)drawRect:(CGRect)rect {
    int leftMargin = 5;
    int topMargin = 3;
    int labelWidth = 40;
    int labelHeight = 18;
    
    _hintLabel1 = [[UILabel alloc] init];
    _hintLabel1.textAlignment = NSTextAlignmentCenter;
    _hintLabel1.layer.cornerRadius = 4;
    _hintLabel1.layer.masksToBounds = YES;
    _hintLabel1.layer.borderWidth = 1;
    _hintLabel1.layer.borderColor = [UIColor orangeColor].CGColor;
    _hintLabel1.textColor = [UIColor orangeColor];
    _hintLabel1.font = [UIFont systemFontOfSize:14];
    [self addSubview:_hintLabel1];
    
    _hintLabel2 = [[UILabel alloc] init];
    _hintLabel2.textAlignment = NSTextAlignmentCenter;
    _hintLabel2.layer.cornerRadius = 4;
    _hintLabel2.layer.masksToBounds = YES;
    _hintLabel2.layer.borderWidth = 1;
    _hintLabel2.layer.borderColor = [UIColor blueColor].CGColor;
    _hintLabel2.textColor = [UIColor blueColor];
    _hintLabel2.font = [UIFont systemFontOfSize:14];
    [self addSubview:_hintLabel2];
    
    /**********************3*****************************************************/
    
    _hintDescLabel1 = [[UILabel alloc] init];
    _hintDescLabel1.font = [UIFont systemFontOfSize:14];
    [self addSubview:_hintDescLabel1];
    
    _hintDescLabel2 = [[UILabel alloc] init];
    _hintDescLabel2.font = [UIFont systemFontOfSize:14];
    [self addSubview:_hintDescLabel2];
    
    
    _hintLabel1.frame = CGRectMake(leftMargin, topMargin, labelWidth, labelHeight);
    _hintLabel2.frame = CGRectMake(leftMargin, CGRectGetHeight(rect) / 2 + topMargin, labelWidth, labelHeight);
    
    _hintDescLabel1.frame = CGRectMake(leftMargin + labelWidth + 10,
                                       topMargin,
                                       CGRectGetWidth(rect) - (leftMargin + labelWidth + 10),
                                       labelHeight);
    
    _hintDescLabel2.frame = CGRectMake(leftMargin + labelWidth + 10,
                                       CGRectGetHeight(rect) / 2 + topMargin,
                                       CGRectGetWidth(rect) - (leftMargin + labelWidth + 10),
                                       labelHeight);
    
    _hintLabel1.text = self.item.title;
    _hintDescLabel1.text = self.item.detail;
    _hintLabel2.text = self.item.title1;
    _hintDescLabel2.text = self.item.detail1;
}

- (void)layoutSubviews {
    self.backgroundColor = [UIColor whiteColor];
}


@end

@interface XLsn0wHeadlineView () <UIScrollViewDelegate>

@property (nonatomic, strong) NSTimer *timer;

@end

static int hintViewHeight = 60;

@implementation XLsn0wHeadlineView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self drawUI];
    }
    return self;
}

- (void)drawUI {
    _bottomScrollView = [[UIScrollView alloc] init];
    [self addSubview:_bottomScrollView];
    [_bottomScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(20*2+(hintViewHeight-10));
        make.width.mas_equalTo([[UIScreen mainScreen] bounds].size.width-90);
        make.height.mas_equalTo(hintViewHeight);
    }];
    _bottomScrollView.showsVerticalScrollIndicator = NO;
    _bottomScrollView.pagingEnabled = YES;
    _bottomScrollView.delegate = self;
    _bottomScrollView.scrollEnabled = NO;
    _autoscroll = YES;
    _timeInterval = 2;
    
    _leftImageView = [[UIImageView alloc] init];
    [self addSubview:_leftImageView];
    _leftImageView.image = [UIImage imageNamed:@"leftImageView"];
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(11);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(hintViewHeight-10);
        make.height.mas_equalTo(hintViewHeight-10);
    }];
}

/** items setter */
- (void)setItems:(NSArray *)items {
    if (items.count == 0) return;
    
    NSMutableArray *mutableItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        [mutableItems addObjectsFromArray:items];
    }
    
    _items = mutableItems.copy;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self initSelf];
    });
}

- (void)initSelf {
    
    int count = (int)[self.items count];
    
    self.bottomScrollView.contentSize = CGSizeMake(0, hintViewHeight * count);
    
    for (int i = 0; i < count; i ++) {
        
        _hintView = [[HintView alloc] init];
        [self.bottomScrollView addSubview:_hintView];
        CGRect frame = CGRectMake(0, hintViewHeight * i, [UIScreen mainScreen].bounds.size.width - 72, hintViewHeight);
        _hintView.frame = frame;
        _hintView.item = [self.items objectAtIndex:(i % (count / 3))];
        _hintView.backgroundColor = [UIColor redColor];
        
   
        
    }
    
    for (int k = 0; k < 2; k ++) {
        CGRect frame = CGRectMake(0, hintViewHeight*k, self.hintView.hintDescLabel1.frame.size.width, self.hintView.hintDescLabel1.frame.size.height);
        UIButton *textButton1 = [[UIButton alloc] initWithFrame:frame];
        [self.bottomScrollView addSubview:textButton1];
        [textButton1 addTarget:self action:@selector(textButton1Action:) forControlEvents:UIControlEventTouchUpInside];
        textButton1.tag = k;
    }
    
    for (int j = 0; j < 2; j ++) {
        CGRect frame = CGRectMake(0, hintViewHeight * j, self.hintView.hintDescLabel2.frame.size.width, self.hintView.hintDescLabel2.frame.size.height);
        UIButton *textButton2 = [[UIButton alloc] initWithFrame:frame];
        [self.bottomScrollView addSubview:textButton2];
        [textButton2 addTarget:self action:@selector(textButton2Action:) forControlEvents:UIControlEventTouchUpInside];
        textButton2.tag = j;
    }
    
    
    [self addTimer];
}

- (void)textButton1Action:(UIButton *)textButton {
    int count = (int)[self.items count];
    int tag = (int)(textButton.tag);
    int selectedIndex = tag % (count / 3);
    
    if (self.didSelectItemAtIndex) {
        self.didSelectItemAtIndex(selectedIndex);
    }
    
 
    
    [self.xlsn0wDelegate upTextButtonTag:tag selectedItem:[self.items objectAtIndex:tag] selectedItemIndex:selectedIndex];
}

- (void)textButton2Action:(UIButton *)textButton {
    int count = (int)[self.items count];
    int tag = (int)(textButton.tag);
    int selectedIndex = tag % (count / 3);
    
    if (self.didSelectItemAtIndex) {
        self.didSelectItemAtIndex(selectedIndex);
    }
    
    
    
    [self.xlsn0wDelegate downTextButtonTag:tag selectedItem:[self.items objectAtIndex:tag] selectedItemIndex:selectedIndex];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageHeight = hintViewHeight;
    CGFloat periodOffset = pageHeight * (self.items.count / 3);
    CGFloat offsetActivatingMoveToBeginning = pageHeight * ((self.items.count / 3) * 2);
    CGFloat offsetActivatingMoveToEnd = pageHeight * ((self.items.count / 3) * 1);
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > offsetActivatingMoveToBeginning) {
        scrollView.contentOffset = CGPointMake(0, (offsetY - periodOffset));
    } else if (offsetY < offsetActivatingMoveToEnd) {
        scrollView.contentOffset = CGPointMake(0, (offsetY + periodOffset));
    }
}

#pragma mark - Timer

- (void)addTimer {
    [self tearDownTimer];
    
    if (!self.autoscroll) return;
    
    self.timer = [NSTimer timerWithTimeInterval:self.timeInterval
                                         target:self
                                       selector:@selector(timerFire:)
                                       userInfo:nil
                                        repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)tearDownTimer {
    [self.timer invalidate];
}

- (void)timerFire:(NSTimer *)timer {
    CGFloat currentOffset = self.bottomScrollView.contentOffset.y;
    CGFloat targetOffset  = currentOffset + hintViewHeight;

    [self.bottomScrollView setContentOffset:CGPointMake(self.bottomScrollView.contentOffset.x, targetOffset) animated:YES];
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    _timeInterval = timeInterval;
    [self addTimer];
}

@end
