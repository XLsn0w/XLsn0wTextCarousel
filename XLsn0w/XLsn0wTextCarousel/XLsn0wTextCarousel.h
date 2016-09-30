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

#import <UIKit/UIKit.h>

#import "TextInfoView.h"
#import "DataSourceModel.h"

@interface XLsn0wTextCarousel : UIView

@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@property (nonatomic,strong) TextInfoView *currentTextInfoView;
@property (nonatomic,strong) TextInfoView *hiddenTextInfoView;

@property (nonatomic, assign) NSTimeInterval autoTimeInterval;

//停止定时器(界面消失前必须要停止定时器否则内存泄漏)
- (void)stopTimer;

@end
