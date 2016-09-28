//
//  GBTopLineView.h
//  淘宝垂直跑马灯广告
//
//  Created by 张国兵 on 15/8/28.
//  Copyright (c) 2015年 zhangguobing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBTopLineViewModel.h"
@interface GBTopLineView : UIView

@property (nonatomic,copy) void (^clickBlock)(NSInteger index);//第几个数据被点击

//数组内部数据需要是GBTopLineViewModel类型
- (void)setVerticalShowDataArr:(NSMutableArray *)dataArr;

//停止定时器(界面消失前必须要停止定时器否则内存泄漏)
- (void)stopTimer;
@end
