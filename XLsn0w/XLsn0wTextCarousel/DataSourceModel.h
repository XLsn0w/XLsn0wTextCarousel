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

#import <Foundation/Foundation.h>

@interface DataSourceModel : NSObject

@property (nonatomic, copy) NSString *type;//类型 比如热门
@property (nonatomic, strong) NSString *title;//滚动的文章标题
@property (nonatomic, strong) NSString *URLString;//点击获取的URL


/**
 Model用来存储数据在内存里

 @param type      标题的类型 如热门
 @param title     标题
 @param URLString 跳转的http/https链接URL
 */
+ (instancetype)dataSourceModelWithType:(NSString *)type title:(NSString *)title URLString:(NSString *)URLString;

@end
