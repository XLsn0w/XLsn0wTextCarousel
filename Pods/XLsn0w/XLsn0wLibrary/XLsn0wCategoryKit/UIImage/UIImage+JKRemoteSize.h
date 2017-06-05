//
//  UIImage+RemoteSize.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/27.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^JKUIImageSizeRequestCompleted) (NSURL* imgURL, CGSize size);

@interface UIImage (JKRemoteSize)
/**
 *  @brief 获取远程图片的大小
 *
 *  @param imgURL     图片url
 *  @param completion 完成回调
 */
+ (void)jk_requestSizeNoHeader:(NSURL*)imgURL completion:(JKUIImageSizeRequestCompleted)completion;
/**
 *  @brief  从header中获取远程图片的大小 (服务器必须支持)
 *
 *  @param imgURL     图片url
 *  @param completion 完成回调
 */
//+ (void)requestSizeWithHeader:(NSURL*)imgURL completion:(UIImageSizeRequestCompleted)completion;

@end