//
//  GBTopLineView.m
//  淘宝垂直跑马灯广告
//
//  Created by 张国兵 on 15/8/28.
//  Copyright (c) 2015年 zhangguobing. All rights reserved.
//

#import "GBTopLineView.h"

@interface GBTopLineView(){
    
    NSTimer *_timer;     //定时器
    int count;
    int flag; //标识当前是哪个view显示(currentView/hidenView)
    NSMutableArray *_dataArr;
}
@property (nonatomic,strong) UIView *currentView;   //当前显示的view
@property (nonatomic,strong) UIView *hidenView;     //底部藏起的view
@property (nonatomic,strong) UILabel *currentLabel;
@property (nonatomic,strong) UIButton *currentBtn;
@property (nonatomic,strong) UIButton *hidenBtn;
@property (nonatomic,strong) UILabel *hidenLabel;
@end
@implementation GBTopLineView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI
{
    count = 0;
    flag = 0;
    
    self.layer.masksToBounds = YES;
    
    //创建定时器
    [self createTimer];
    [self createCurrentView];
    [self createHidenView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dealTap:)];
    [self addGestureRecognizer:tap];
    //改进
    UILongPressGestureRecognizer*longPress=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(dealLongPress:)];
    [self addGestureRecognizer:longPress];
    
    
}
- (void)setVerticalShowDataArr:(NSMutableArray *)dataArr
{
    _dataArr = dataArr;
    NSLog(@"dataArr-->%@",dataArr);
    GBTopLineViewModel *model = _dataArr[count];
    [self.currentBtn setTitle:model.type forState:UIControlStateNormal];
    self.currentLabel.text = model.title;
}


-(void)dealLongPress:(UILongPressGestureRecognizer*)longPress{
    
    if(longPress.state==UIGestureRecognizerStateEnded){
        
        _timer.fireDate=[NSDate distantPast];
        
        
    }
    if(longPress.state==UIGestureRecognizerStateBegan){
        
        _timer.fireDate=[NSDate distantFuture];
    }
    
    
    
    
}
- (void)dealTap:(UITapGestureRecognizer *)tap
{
    self.clickBlock(count);
}

- (void)createTimer
{
    _timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(dealTimer) userInfo:nil repeats:YES];
}

#pragma mark - 跑马灯操作
-(void)dealTimer
{
    count++;
    if (count == _dataArr.count) {
        count = 0;
    }
    
    if (flag == 1) {
         GBTopLineViewModel*currentModel = _dataArr[count];
        [self.currentBtn setTitle:currentModel.type forState:UIControlStateNormal];
        self.currentLabel.text = currentModel.title;
    }
    
    if (flag == 0) {
        GBTopLineViewModel *hienModel = _dataArr[count];
        [self.hidenBtn setTitle:hienModel.type forState:UIControlStateNormal];
        self.hidenLabel.text = hienModel.title;
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
    GBTopLineViewModel *model = _dataArr[count];
    
    self.currentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.currentView];
    
    //此处是类型按钮(不需要点击)
    self.currentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.currentBtn.frame = CGRectMake(10, 10, 30, self.currentView.frame.size.height-20);
    self.currentBtn.layer.masksToBounds = YES;
    self.currentBtn.layer.cornerRadius = 5;
    self.currentBtn.layer.borderWidth = 1;
    self.currentBtn.layer.borderColor = [UIColor redColor].CGColor;
    [self.currentBtn setTitle:model.type forState:UIControlStateNormal];
    [self.currentBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.currentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.currentView addSubview:self.currentBtn];
    
    //内容标题
    self.currentLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.currentBtn.frame.origin.x+self.currentBtn.frame.size.width+10, 0, self.currentView.frame.size.width-(self.currentBtn.frame.origin.x+self.currentBtn.frame.size.width+10+10), self.currentView.frame.size.height)];
    self.currentLabel.text = model.title;
    self.currentLabel.textAlignment = NSTextAlignmentLeft;
    self.currentLabel.textColor = [UIColor blackColor];
    self.currentLabel.font = [UIFont systemFontOfSize:12];
    [self.currentView addSubview:self.currentLabel];
}

- (void)createHidenView
{
    self.hidenView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.hidenView];
    
    //此处是类型按钮(不需要点击)
    self.hidenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.hidenBtn.frame = CGRectMake(10, 10, 30, self.hidenView.frame.size.height-20);
    self.hidenBtn.layer.masksToBounds = YES;
    self.hidenBtn.layer.cornerRadius = 5;
    self.hidenBtn.layer.borderWidth = 1;
    self.hidenBtn.layer.borderColor = [UIColor redColor].CGColor;
    [self.hidenBtn setTitle:@"" forState:UIControlStateNormal];
    [self.hidenBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.hidenBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.hidenView addSubview:self.hidenBtn];
    
    //内容标题
    self.hidenLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.hidenBtn.frame.origin.x+self.hidenBtn.frame.size.width+10, 0, self.hidenView.frame.size.width-(self.hidenBtn.frame.origin.x+self.hidenBtn.frame.size.width+10+10), self.hidenView.frame.size.height)];
    self.hidenLabel.text = @"";
    self.hidenLabel.textAlignment = NSTextAlignmentLeft;
    self.hidenLabel.textColor = [UIColor blackColor];
    self.hidenLabel.font = [UIFont systemFontOfSize:12];
    [self.hidenView addSubview:self.hidenLabel];
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
