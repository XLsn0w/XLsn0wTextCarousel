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

@class XLsn0wUpDownNoticeView;

@protocol XLsn0wUpDownNoticeViewDataSourceDelegate <NSObject>

/**
 *  @brief 代理做过处理 不用代理会加载默认数据 可自行修改
 */

/**
 *  @brief 数据模型的代理 配合cell使用
 *
 *  @param noticeView self
 *
 *  @return 返回模型数组
 */
- (NSArray *)itemsOfXXUpNoticeView:(XLsn0wUpDownNoticeView *)noticeView;

/**
 *  @brief 自定义界面
 *
 *  @param noticeView self
 *  @param tableView  基于tableview做的 可以用来处理其他需要的功能
 *  @param indexPath  indexpath
 *  @param dataSource  tableview的实际数据源
 *
 *  @return  自定义cell  **cell和self.frame是一样的 注意cell布局根据self.frame来布局**
 */
- (UITableViewCell *)XXUpNoticeView:(XLsn0wUpDownNoticeView *)noticeView tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath dataSource:(NSMutableArray *)dataSource;

/**
 *  @brief 点击对应的notice的触发事件
 *
 *  @param noticeView self
 *  @param index      index
 */
- (void)XXUpNoticeView:(XLsn0wUpDownNoticeView *)noticeView didSelectRow:(NSInteger)index;

@end

@interface XLsn0wUpDownNoticeView : UIView

@property (weak, nonatomic) id<XLsn0wUpDownNoticeViewDataSourceDelegate> dataSourceDelegate;


@end
