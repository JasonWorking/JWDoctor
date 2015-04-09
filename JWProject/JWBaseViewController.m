//
//  JWBaseViewController.m
//  JWProject
//
//  Created by Jason on 15/4/8.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#import "JWBaseViewController.h"

@interface JWBaseViewController ()

@end

@implementation JWBaseViewController
#pragma mark - Life cycle 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.customTitleView;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setters
- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    self.customTitleLabel.text = title;
    self.customTitleView.shimmering = YES;
}

#pragma mark - Getters
- (FBShimmeringView *)customTitleView
{
    if (!_customTitleView) {
        _customTitleView = [[FBShimmeringView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width/4, self.navigationController.navigationBar.bounds.size.height/3)];
        _customTitleView.shimmeringSpeed = 20;
        _customTitleLabel  = [[UILabel alloc] initWithFrame:_customTitleView.bounds];
        _customTitleLabel.textAlignment = NSTextAlignmentCenter;
        _customTitleView.contentView = _customTitleLabel;
    }
    return _customTitleView;
}


@end
