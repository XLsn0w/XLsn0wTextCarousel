//
//  UIButton+countDown.h
//  NetworkEgOc
//
//  Created by iosdev on 15/3/17.
//  Copyright (c) 2015年 iosdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JKCountDown)
-(void)jk_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;
@end
