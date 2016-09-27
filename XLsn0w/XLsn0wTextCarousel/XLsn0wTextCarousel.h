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

@class XLsn0wTextCarousel;

@protocol XLsn0wTextCarouselDelegate<NSObject>

- (void)NewsBanner:(XLsn0wTextCarousel *)newsBanner didSelectIndex:(NSInteger)selectIndex;

@end

@interface XLsn0wTextCarousel : UIView

@property (nonatomic ,strong) UILabel *notice;
@property(nonatomic,assign)NSTimeInterval duration;
@property (nonatomic ,strong) NSArray *noticeList;
@property(nonatomic,weak)id <XLsn0wTextCarouselDelegate>delegate;

- (void)startCarousel;

@end
