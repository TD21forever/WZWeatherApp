//
//  WZTabBarController.m
//  WZWeatherApp
//
//  Created by T D on 2022/8/19.
//

#import "WZTabBarController.h"
#import "HomeViewController.h"
#import "LocationTableVC.h"
#import "LifeStyleTableVC.h"

@interface WZTabBarController ()

@end

@implementation WZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    UITabBarItemAppearance* itemAppearance = [UITabBarItemAppearance new];
    itemAppearance.normal.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
    itemAppearance.selected.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
    
    UITabBarAppearance* tabbarAppearance = self.tabBar.standardAppearance;
    tabbarAppearance.stackedLayoutAppearance = itemAppearance;
    self.tabBar.scrollEdgeAppearance = tabbarAppearance;
    
    // homeView Nav
    HomeViewController* homeVC = [[HomeViewController alloc]init];
    UINavigationController * navVC = [[UINavigationController alloc]initWithRootViewController:homeVC];
    navVC.title = @"天气";
    navVC.tabBarItem.image = [UIImage systemImageNamed:@"sun.max"];
    navVC.tabBarItem.selectedImage = [UIImage systemImageNamed:@"sun.max.fill"];
    navVC.tabBarController.hidesBottomBarWhenPushed = YES;

    [self addChildViewController:navVC];
    
    // lifeVC
    LifeStyleTableVC* lifeStyleVC = [LifeStyleTableVC new];
    lifeStyleVC.tabBarItem.title = @"生活";
    lifeStyleVC.tabBarItem.image = [UIImage systemImageNamed:@"ellipsis.circle"];
    lifeStyleVC.tabBarItem.selectedImage = [UIImage systemImageNamed:@"ellipsis.circle.fill"];
    [self addChildViewController:lifeStyleVC];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
