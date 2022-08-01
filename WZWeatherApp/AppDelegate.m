//
//  AppDelegate.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LocationTableVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController* rootVC = [[ViewController alloc]init];
    UINavigationController * navVC = [[UINavigationController alloc]initWithRootViewController:rootVC];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = navVC;
    return YES;
}

@end
