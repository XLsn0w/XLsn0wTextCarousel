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

@interface XLsn0wTopLineView : UIView

@property (nonatomic,copy) void (^clickBlock)(NSInteger index);//第几个数据被点击

//数组内部数据需要是GBTopLineViewModel类型
- (void)setVerticalShowDataArr:(NSMutableArray *)dataArr;

//停止定时器(界面消失前必须要停止定时器否则内存泄漏)
- (void)stopTimer;

@end

/**************************************************************************************************/

@interface TopLineViewModel : NSObject

@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *title;

@end