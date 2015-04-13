//
//  GTTableViewManager.h
//
//  Created by Jason on 15/4/9.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTArrayDataSource.h"
#import "GTTableViewDelegater.h"


typedef void(^GTDidInitializeCellBlock)(GTArrayDataSource *dataSource,id cell, UITableView *tableView, NSIndexPath *indexPath);


@interface GTTableViewManager : NSObject

@property (nonatomic, copy  ) NSArray *items;
@property (nonatomic, assign) Class   cellClass;

@property (nonatomic, strong, readonly) GTTableViewDelegater *delegater;
@property (nonatomic, strong, readonly) GTArrayDataSource    *dataSourcer;
@property (nonatomic, weak, readonly  ) UITableView          *tableView;
@property (nonatomic, copy) GTDidSelectedCellBlock          didSelectedBlock;
@property (nonatomic, copy) GTDidInitializeCellBlock        didInitializeCellBlock;



- (instancetype)initWithTableView:(UITableView *)tableView
                            items:(NSArray *)items
                        cellClass:(Class)clazz;


- (instancetype)initWithTableView:(UITableView *)tableView
                            items:(NSArray *)items
                        cellClass:(Class)clazz
                  configCellBlock:(GTConfigureCellBlock)block;


/**
 *  Designated Initializer
 *
 *  @param tableView     The tableView whose datasource and delegate will be managed by this manager.
 *  @param items         The model items.
 *  @param clazz         The cell's class, default is 'UITableViewCell'
 *  @param configBlock   A block to configure the cell's content. This block will get called when a cell is dequeued from the reusable cell pool only if the cell's class dose NOT response to '＋(void)configCellWithItem:(id)item'.
 *  @param selectedBlock A block to response to the \c tableView's 'tableView:didSelectedRowAtIndexPath:'.Usually perform actions.
 *
 *  @return A manager for managments of the \c tableView's dataSource and delegate.
 */
- (instancetype)initWithTableView:(UITableView *)tableView
                            items:(NSArray *)items
                        cellClass:(Class)clazz
                  configCellBlock:(GTConfigureCellBlock)configBlock
                 didSelectedBlock:(GTDidSelectedCellBlock)selectedBlock;

@end
