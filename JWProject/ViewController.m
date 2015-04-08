//
//  ViewController.m
//  JWProject
//
//  Created by Jason on 15/4/3.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#import "ViewController.h"
#import <ImagePlayerView/ImagePlayerView.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()<ImagePlayerViewDelegate>

@property (weak, nonatomic) IBOutlet ImagePlayerView *imagePlayerView;
@property (nonatomic, strong) NSArray *imageURLs;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    self.imageURLs = @[[NSURL URLWithString:@"http://sudasuta.com/wp-content/uploads/2013/10/10143181686_375e063f2c_z.jpg"],
                       [NSURL URLWithString:@"http://www.yancheng.gov.cn/ztzl/zgycddhsdgy/xwdt/201109/W020110902584601289616.jpg"],
                       [NSURL URLWithString:@"http://fzone.oushinet.com/bbs/data/attachment/forum/201208/15/074140zsb6ko6hfhzrb40q.jpg"]];
    self.imagePlayerView.imagePlayerViewDelegate = self;
    
    // set auto scroll interval to x seconds
    self.imagePlayerView.scrollInterval = 5.0f;
    
    // adjust pageControl position
    self.imagePlayerView.pageControlPosition = ICPageControlPosition_BottomCenter;
    
    // hide pageControl or not
    self.imagePlayerView.hidePageControl = NO;
    
    // adjust edgeInset
    self.imagePlayerView.edgeInsets = UIEdgeInsetsZero;
    
    [self.imagePlayerView reloadData];
    

}

- (void)buttonTapped:(UIButton *)button
{
    NSLog(@"button tapped!");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ImagePlayerViewDelegate 

- (NSInteger)numberOfItems
{
    return  [self.imageURLs count];
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView
  loadImageForImageView:(UIImageView *)imageView
                  index:(NSInteger)index
{
    [imageView sd_setImageWithURL:self.imageURLs[index]
                 placeholderImage:nil];
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView
          didTapAtIndex:(NSInteger)index
{
    NSLog(@"Did tap at index : %ld", (long)index);
}


@end
