//
//  GTArrayDataSource.h
//
//  Created by Jason on 15/4/9.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol GTTableViewDataSourceDelegate;

typedef void(^GTConfigureCellBlock)(UITableViewCell *cell,id item);

@interface GTArrayDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, copy) GTConfigureCellBlock configBlock;

@property (nonatomic, copy) NSArray *items;

@property (nonatomic, assign) Class cellClass;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) id<GTTableViewDataSourceDelegate> delegate;

- (instancetype)initWithItems:(NSArray *)items
                    cellClass:(Class)clazz
           configureCellBlock:(GTConfigureCellBlock)block;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
