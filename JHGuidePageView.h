//
//  JHGuidePageView.h
//  JHKit
//
//  Created by HaoCold on 2017/2/9.
//  Copyright © 2017年 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2017 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

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

/**
 * @breif 传入图片名称数组 与 按钮
 * @param images 图片名称数组
 * @param button 按钮
 */
+ (instancetype)jh_guidePageViewWithImages:(NSArray<NSString *> *)images
                                    button:(UIButton *)button;
@end
