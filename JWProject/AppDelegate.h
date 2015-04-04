//
//  AppDelegate.h
//  JWProject
//
//  Created by Jason on 15/4/3.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CoreDataStack.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CoreDataStack *coreDataStack;

@property (nonatomic, strong) UIWindow *introWindow;

- (void)showIntroViewIfNeeded;

@end

