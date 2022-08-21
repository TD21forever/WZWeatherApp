//
//  AppDelegate.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import "AppDelegate.h"
#import "WZTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    WZTabBarController* tabbar = [WZTabBarController new];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = tabbar;
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-hans",nil]  forKey:@"AppleLanguages"];

    return YES;
}

@end
