//
//  NewNoticeView.m
//  NewsBannerDemo
//
//  Created by sunhao－iOS on 16/4/28.
//  Copyright © 2016年 ssyzh. All rights reserved.
//

#import "NewsBanner.h"
#import "Masonry.h"

@implementation NewsBanner

static int countInt=0;


- (void)setNoticeList:(NSArray *)noticeList
{

    if (_noticeList != noticeList) {
        _noticeList = noticeList;
        if (_noticeList.count != 0) {
            _notice.text = _noticeList[0];
        }
        
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initContentView];
    }
    
    return self;
}

- (void)initContentView{
    self.clipsToBounds = YES;
    self.notice = [UILabel new];
    self.notice.font = [UIFont systemFontOfSize:15.0];
    self.notice.textColor = [UIColor lightGrayColor];
    self.notice.userInteractionEnabled = YES;
    [self addSubview:self.notice];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.notice addGestureRecognizer:tap];
    
    
}

- (void)layoutSubviews{
    
    [self.notice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];

}

-(void)displayNews{
    countInt++;
 
    if (countInt >= [self.noticeList count])
        countInt=0;
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f ;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromTop;
    [self.notice.layer addAnimation:animation forKey:@"animationID"];
    self.notice.text = self.noticeList[countInt];

}
- (void)tap:(UITapGestureRecognizer *)tap
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(NewsBanner:didSelectIndex:)]) {
        
        [_delegate NewsBanner:self didSelectIndex:countInt];
        
    }

}
- (void)star
{
    if (self.noticeList.count != 0) {
      [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(displayNews) userInfo:nil repeats:YES];  
    }
    
}
@end
