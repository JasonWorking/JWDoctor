//
//  JWBaseViewController.h
//  JWProject
//
//  Created by Jason on 15/4/8.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Shimmer/FBShimmeringView.h>


@interface JWBaseViewController : UIViewController

@property (nonatomic, strong) FBShimmeringView *customTitleView;
@property (nonatomic, strong) UILabel *customTitleLabel;


@end
