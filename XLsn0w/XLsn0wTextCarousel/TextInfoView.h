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

#import "DataSourceModel.h"

@protocol TextInfoViewDelegate <NSObject>

- (void)handleTopEventWithURLString:(NSString *)URLString;
- (void)handleBottomEventWithURLString:(NSString *)URLString;

//通过代理在set方法, 获取存取在Model中的信息
- (void)getTopDataSourceModel:(DataSourceModel *)topDataSourceModel;
- (void)getBottomDataSourceModel:(DataSourceModel *)bottomDataSourceModel;

@end

@interface TextInfoView : UIView

@property (nonatomic, weak) id<TextInfoViewDelegate> xlsn0wDelegate;

@property (nonatomic, strong) DataSourceModel *topModel;
@property (nonatomic, strong) DataSourceModel *bottomModel;

@end
