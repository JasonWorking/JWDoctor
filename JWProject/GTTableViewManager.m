//
//  GTTableViewManager.m
//
//  Created by Jason on 15/4/9.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#import "GTTableViewManager.h"
#import "GTTableViewProtocol.h"
@interface GTTableViewManager ()<GTTableViewDelegateDataSource,GTTableViewDataSourceDelegate>

@end


@implementation GTTableViewManager

#pragma mark - Initializer

- (instancetype)init
{
    return [self initWithTableView:nil
                             items:nil
                         cellClass:UITableViewCell.class
                   configCellBlock:nil
                  didSelectedBlock:nil];
}

- (instancetype)initWithTableView:(UITableView *)tableView
                            items:(NSArray *)items
                        cellClass:(Class)clazz
{
    return [self initWithTableView:tableView
                             items:items
                         cellClass:clazz
                   configCellBlock:nil
                  didSelectedBlock:nil];
}


- (instancetype)initWithTableView:(UITableView *)tableView
                            items:(NSArray *)items
                        cellClass:(Class)clazz
                  configCellBlock:(GTConfigureCellBlock)block
{
    return [self initWithTableView:tableView
                             items:items
                         cellClass:clazz
                   configCellBlock:block didSelectedBlock:nil];
}




- (instancetype)initWithTableView:(UITableView *)tableView
                            items:(NSArray *)items
                        cellClass:(Class)clazz
                  configCellBlock:(GTConfigureCellBlock)configBlock
                 didSelectedBlock:(GTDidSelectedCellBlock)selectedBlock;
{
    self = [super init];
    if (self) {
        _tableView = tableView;
        _items = [items copy];
        _cellClass = clazz;
        _dataSourcer = [[GTArrayDataSource alloc] initWithItems:_items
                                                      cellClass:_cellClass
                                             configureCellBlock:configBlock];
        _dataSourcer.delegate = self;
        _tableView.dataSource = _dataSourcer;
        _delegater = [[GTTableViewDelegater alloc] initWithTableView:tableView];
        _delegater.dataSource = self;
        _delegater.didSelectedBlock = [selectedBlock copy];
    }
    return self;
}


#pragma mark - Setter 
- (void)setDidSelectedBlock:(GTDidSelectedCellBlock)didSelectedBlock
{
    _didSelectedBlock = didSelectedBlock;
    self.delegater.didSelectedBlock = [didSelectedBlock copy];
}

- (void)setCellClass:(Class)cellClass
{
    _cellClass = cellClass;
    self.dataSourcer.cellClass = cellClass;
}


- (void)setItems:(NSArray *)items
{
    _items = items;
    self.dataSourcer.items = items;
}

#pragma mark - GTTableViewDelegateDateSource
- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSourcer itemAtIndexPath:indexPath];
}

- (Class)cellClassAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO: Muti-cellClass support .
    return self.cellClass;
}


#pragma mark - GTTableViewDataSourceDelegate

- (void)dataSource:(GTArrayDataSource *)dataSource
 didInitializeCell:(id)cell
      forTableView:(UITableView *)tableView
       atIndexPath:(NSIndexPath *)indexPath
{
    if (self.didInitializeCellBlock) {
        self.didInitializeCellBlock(dataSource, cell, tableView, indexPath);
    }
}





@end
