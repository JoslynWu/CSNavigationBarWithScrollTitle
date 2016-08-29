//
//  AppDelegate.m
//  CSNavigationBarWihtScrollTitle
//
//  Created by CS on 8/29/16.
//  Copyright © 2016 Joslyn. All rights reserved.
//

#import "AppDelegate.h"
#import "CSOneViewController.h"
#import "CSTwoTableViewController.h"
#import "CSThreeTableViewController.h"
#import "CSFourTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabBarCtl = [[UITabBarController alloc] init];
    
    
    //one
    CSOneViewController *oneViewCtl = [[CSOneViewController alloc] init];
    
    UINavigationController *oneNav = [self createNavCtrollerWith:oneViewCtl
                                                  andTabBarTitle:@"资讯"
                                                     normolImage:@"tab_icon_news_normal"
                                                     selectImage:@"tab_icon_news_press"];

    
    //two
    CSTwoTableViewController *twoViewCtl = [[CSTwoTableViewController alloc] init];
    
    UINavigationController *twoNav = [self createNavCtrollerWith:twoViewCtl
                                                  andTabBarTitle:@"好友"
                                                     normolImage:@"tab_icon_friend_normal"
                                                     selectImage:@"tab_icon_friend_press"];
    
  
    //three
    CSThreeTableViewController *threeViewCtl = [[CSThreeTableViewController alloc] init];
    
    UINavigationController *threeNav = [self createNavCtrollerWith:threeViewCtl
                                                  andTabBarTitle:@"发现"
                                                     normolImage:@"tab_icon_quiz_normal"
                                                     selectImage:@"tab_icon_quiz_press"];
    
    //four
    CSFourTableViewController *fourViewCtl = [[CSFourTableViewController alloc] init];
    
    UINavigationController *fourNav = [self createNavCtrollerWith:fourViewCtl
                                                  andTabBarTitle:@"我的"
                                                     normolImage:@"tab_icon_more_normal"
                                                     selectImage:@"tab_icon_more_press"];

    
    [tabBarCtl setViewControllers:@[oneNav, twoNav, threeNav, fourNav] animated:YES];
    
    
    //设置外观
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg_for_seven"] forBarMetrics:UIBarMetricsDefault];
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    
    [self.window setRootViewController:tabBarCtl];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(UINavigationController *)createNavCtrollerWith:(UIViewController *)viewCtl andTabBarTitle:(NSString *)title normolImage:(NSString *)normalImageName selectImage:(NSString *)selectImageName{

    UINavigationController *navCtl = [[UINavigationController alloc] initWithRootViewController:viewCtl];
    
    navCtl.tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                       image:[UIImage imageNamed:normalImageName]
                                               selectedImage:[self setImageOriginalMode:selectImageName]];
    
    return navCtl;
}



-(UIImage *)setImageOriginalMode:(NSString *)imageName{
 
    UIImage *image = [UIImage imageNamed:imageName];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
}



@end
