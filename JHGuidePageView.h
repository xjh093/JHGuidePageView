//
//  JHGuidePageView.h
//  JHKit
//
//  Created by HaoCold on 2017/2/9.
//  Copyright © 2017年 HaoCold. All rights reserved.
//

/**< 引导页面 */

#import <UIKit/UIKit.h>

@interface JHGuidePageView : UIView

/**
 * @breif 传入图片名称数组 按钮默认在最后一页，全屏，透明
 * @param images 图片名称数组
 */
+ (instancetype)jh_guidePageViewWithImages:(NSArray<NSString *> *)images;

/**
 * @breif 传入图片名称数组 与 按钮的frame  按钮透明
 * @param images 图片名称数组
 * @param frame 按钮的frame
 */
+ (instancetype)jh_guidePageViewWithImages:(NSArray<NSString *> *)images
                               buttonFrame:(CGRect)frame;

@end
