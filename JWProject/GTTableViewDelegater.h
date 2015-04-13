//
//  GTTableViewDelegater.h
//
//  Created by Jason on 15/4/9.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol GTTableViewDelegateDataSource;

typedef void(^GTDidSelectedCellBlock)(UITableView *tableView, NSIndexPath *indexPath);

@interface GTTableViewDelegater : NSObject<UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) id<GTTableViewDelegateDataSource> dataSource;

@property (nonatomic, copy) GTDidSelectedCellBlock didSelectedBlock;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
