//
//  JHGuidePageView.m
//  JHKit
//
//  Created by HaoCold on 2017/2/9.
//  Copyright © 2017年 HaoCold. All rights reserved.
//

#import "JHGuidePageView.h"

#define kWidth   [UIScreen mainScreen].bounds.size.width
#define kHeight  [UIScreen mainScreen].bounds.size.height

@interface JHGuidePageView()<UIScrollViewDelegate>

@end

@implementation JHGuidePageView

NSArray *_images;
CGRect _buttonFrame;

static inline id _jhInit()
{
    if (_images.count == 0) {
        return nil;
    }
    
    return [[JHGuidePageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
}

+ (instancetype)jh_guidePageViewWithImages:(NSArray<NSString *> *)images
{
    _images = images;
    return _jhInit();
}

+ (instancetype)jh_guidePageViewWithImages:(NSArray<NSString *> *)images
                               buttonFrame:(CGRect)frame
{
    _images = images;
    _buttonFrame = frame;
    return _jhInit();
}

#pragma mark - 首次登录或者版本更新
static inline BOOL _jhIsFirst()
{
    //获取当前应用的版本号
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = dic[@"CFBundleShortVersionString"];
    NSString *savedVersion = [[NSUserDefaults standardUserDefaults]
                              objectForKey:@"JHSavedVersionString"];
    
    //首次 或 版本更新
    if (savedVersion == nil ||
        ![savedVersion isEqualToString:currentVersion]) {
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion
                                                  forKey:@"JHSavedVersionString"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        return YES;
    }
    return NO;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (_jhIsFirst()) {
            [self jhSetupViews];
            
            UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
            [window addSubview:self];
            
        }
    }
    return self;
}

#pragma mark - 初始化视图
- (void)jhSetupViews
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.bounds;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(_images.count*kWidth, kHeight);
    [self addSubview:scrollView];
    
    for (int i = 0; i < _images.count; ++i) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*kWidth, 0, kWidth, kHeight)];
        UIImage *image = [UIImage imageNamed:_images[i]];
        imageView.image = image;
        [scrollView addSubview:imageView];
        if (!image) {
            UILabel *label = [[UILabel alloc] initWithFrame:imageView.frame];
            label.text = @"此页图片缺失\nThis page is no image";
            label.textAlignment = 1;
            label.numberOfLines = 0;
            label.font = [UIFont boldSystemFontOfSize:25];
            label.backgroundColor = [UIColor whiteColor];
            [scrollView addSubview:label];
        }
        
        if (i == _images.count - 1) {
            UIButton *button = [[UIButton alloc] init];
            button.frame = imageView.frame;
            [button addTarget:self action:@selector(jhEnter) forControlEvents:1<<6];
            [scrollView addSubview:button];
            
            if (!CGRectIsEmpty(_buttonFrame)) {
                
                CGFloat X = _buttonFrame.origin.x;
                if (X < kWidth && X > 0) {
                    X += (_images.count - 1) * kWidth;
                }
                
                CGRect bFrame = button.frame;
                bFrame.size.width = _buttonFrame.size.width;
                bFrame.size.height = _buttonFrame.size.height;
                bFrame.origin.y = _buttonFrame.origin.y;
                bFrame.origin.x = X;
                
                button.frame = bFrame;
            }
        }
    }
}

#pragma mark - 隐藏引导页
- (void)jhEnter
{
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self removeFromSuperview];
        });
    }];
}

@end
