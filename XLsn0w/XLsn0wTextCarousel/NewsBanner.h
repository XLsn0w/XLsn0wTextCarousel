//
//  NewsBanner.h
//  NewsBannerDemo
//
//  Created by sunhao－iOS on 16/4/28.
//  Copyright © 2016年 ssyzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsBanner;
@protocol NewsBannerDelegate<NSObject>

- (void)NewsBanner:(NewsBanner *)newsBanner didSelectIndex:(NSInteger)selectIndex;

@end
@interface NewsBanner : UIView

@property (nonatomic ,strong) UILabel *notice;
@property(nonatomic,assign)NSTimeInterval duration;
@property (nonatomic ,strong) NSArray *noticeList;
@property(nonatomic,assign)id <NewsBannerDelegate>delegate;
- (void)star;
@end
