//
//  AppDelegate.m
//  LearnDemo
//
//  Created by 王兴财 on 2018/2/24.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//
/*终端命令：git项目管理
一、提交本地项目到GitHup步骤：
 1、在githup上创建和本地项目的同名Repository
 2、打开终端 cd到本地项目根目录下，执行git命令
   cd 目录
   git pull GitHup仓库地址
   git init
 3、将本地项目工作区的所有文件添加到暂存区
   git add .
 4、将暂存区的文件提交到本地仓库
   git commit -m "提交信息..."
 5、将本地仓库关联到GitHup上
   git remote add origin GitHup仓库地址
 6、最后一步，将代码由本地仓库上传到GitHup远程仓库
   git push -u origin master 第一次提交添加命令参数 -u 确保关联本地库和远程库
   git push origin master    非第一次提交使用此命令即可
 */

#import "AppDelegate.h"
#import "TabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    TabBarController *tabVC = [[TabBarController alloc] init];
    self.window.rootViewController = tabVC;
    
    
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
