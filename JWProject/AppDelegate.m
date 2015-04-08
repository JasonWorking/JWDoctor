//
//  AppDelegate.m
//  JWProject
//
//  Created by Jason on 15/4/3.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//


#import "AppDelegate.h"
#import "CoreDataStack.h"
#import <EAIntroView/EAIntroView.h>

@interface AppDelegate ()<EAIntroDelegate>

@end

@implementation AppDelegate

#pragma mark - Lifecycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self showIntroViewIfNeeded];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {
    
    [self.coreDataStack saveContext];
}
#pragma mark - Getter

- (UIWindow *)introWindow
{
    if (!_introWindow){
        _introWindow  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _introWindow.windowLevel  = UIWindowLevelStatusBar;
    }
    return _introWindow;
}

#pragma mark - Helper

- (void)showIntroViewIfNeeded
{
    if([self needsShowIntroView]){
        [self showIntroWithCrossDissolve];
    }
}

#pragma mark - Check if needs show introduction view
- (BOOL)needsShowIntroView
{
    //TODO: check if needs show intro window
    return YES;
}

#pragma mark - Introduction View
static NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";


// MARK: show introduction view
- (void)showIntroWithCrossDissolve {
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"bg_intro_1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_intro_1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = sampleDescription2;
    page2.bgImage = [UIImage imageNamed:@"bg_intro_2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_intro_2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"bg_intro_3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_intro_3"]];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg_intro_4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_intro_4"]];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.introWindow.bounds andPages:@[page1,page2,page3,page4]];
    [intro setDelegate:self];
    
    [self.introWindow makeKeyAndVisible];
    
    [intro showInView:self.introWindow animateDuration:0.0];
}

//MARK:  EAIntroViewDelegate
- (void)introDidFinish:(EAIntroView *)introView
{
    [self.window makeKeyAndVisible];
    self.introWindow = nil;
}


@end
