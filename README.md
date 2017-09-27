# JHGuidePageView
引导页

### Use
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[JHTabBarController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //在根控制器设置好之后 & After the rootViewController is set.
    [JHGuidePageView jh_guidePageViewWithImages:@[@"guide_1",@"guide_2",@"guide_3"]];
    
    return YES;
}

```
