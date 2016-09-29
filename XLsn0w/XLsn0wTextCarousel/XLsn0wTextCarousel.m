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

#import "XLsn0wTextCarousel.h"

@interface XLsn0wTextCarousel () {
    
    NSTimer *_timer;     //定时器
    int count;  // 哪个 modle
    int page; // 哪一页
    int flag; //标识当前是哪个view显示(currentView/hidenView)
    NSMutableArray *_dataArr;
}

@property (nonatomic,strong) UIView *currentView;   //当前显示的view
@property (nonatomic,strong) UIView *hidenView;     //底部藏起的view

@end

@implementation XLsn0wTextCarousel

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    count = 0;
    flag = 0;
  
    
    self.layer.masksToBounds = YES;

    //创建定时器    
    [self createCurrentView];
    [self createHidenView];
    [self createTimer];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    
}
- (void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr = dataArr;
    
    DataModel *currentTopModel = _dataArr[count];
    DataModel *currentBottomModel;
    currentBottomModel = _dataArr[count + 1];

    self.currentTextInfoView.topModel = currentTopModel;
    self.currentTextInfoView.bottomModel = currentBottomModel;

}

- (void)createTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(dealTimer) userInfo:nil repeats:YES];
}

#pragma mark - 跑马灯操作
-(void)dealTimer
{
    
    count += 2;
    if (count >= _dataArr.count) {
        count = 0;
    }

    
    // 要增加判断 count + 1 没有值的情况下
    if (flag == 1) {
        // currernt 赋值
        
        DataModel *currentTopModel = _dataArr[count];
        DataModel *currentBottomModel;
        if(count + 1 >= _dataArr.count){
            currentBottomModel = nil;
        }
        currentBottomModel = _dataArr[count + 1];
        self.currentTextInfoView.topModel = currentTopModel;
        self.currentTextInfoView.bottomModel = currentBottomModel;
        

    }
    
    if (flag == 0) {
        //hidden 赋值
        DataModel *hienTopModel = _dataArr[count];
        DataModel *hiddenBottomModel;
        if(count + 1 >= _dataArr.count){
            hiddenBottomModel = nil;
        }
        hiddenBottomModel = _dataArr[count + 1];
        
        self.hiddenTextInfoView.topModel = hienTopModel;
        self.hiddenTextInfoView.bottomModel = hiddenBottomModel;

    }
    if (flag == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.currentView.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            flag = 1;
            self.currentView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
        }];
        [UIView animateWithDuration:0.5 animations:^{
            self.hidenView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }else{
        
        [UIView animateWithDuration:0.5 animations:^{
            self.hidenView.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            flag = 0;
            self.hidenView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.width);
        }];
        [UIView animateWithDuration:0.5 animations:^{
            self.currentView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)createCurrentView
{
    DataModel *topModel = _dataArr[count];
    DataModel *bottomModel;
    if (count + 1 >= _dataArr.count) {
        bottomModel = nil;
    }
    bottomModel = _dataArr[count + 1];


    self.currentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.currentView];
   
    //self.currentTest = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([TestView class]) owner:nil options:nil]lastObject];
    self.currentTextInfoView = [[TextInfoView alloc] init];
    self.currentTextInfoView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.currentTextInfoView.topModel = topModel;
    self.currentTextInfoView.bottomModel = bottomModel;

    [self.currentView addSubview:self.currentTextInfoView];
}

- (void)createHidenView {
    DataModel *topModel = _dataArr[count];
    DataModel *bottomModel;
    if (count + 1 >= _dataArr.count) {
        bottomModel = nil;
    }
    bottomModel = _dataArr[count + 1];

    self.hidenView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height , self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.hidenView];
    
    //self.hiddenTest = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([TestView class]) owner:nil options:nil]lastObject];
    self.hiddenTextInfoView = [[TextInfoView alloc] init];
    self.hiddenTextInfoView.frame = self.hidenView.bounds;
    
    self.hiddenTextInfoView.topModel = topModel;
    self.hiddenTextInfoView.bottomModel = bottomModel;
    [self.hidenView addSubview:self.hiddenTextInfoView];

}

#pragma mark - 停止定时器
- (void)stopTimer
{
    //停止定时器
    //在invalidate之前最好先用isValid先判断是否还在线程中：
    if ([_timer isValid] == YES) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
