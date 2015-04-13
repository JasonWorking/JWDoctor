//
//  GTArrayDataSource.m
//
//  Created by Jason on 15/4/9.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#import "GTArrayDataSource.h"
#import "GTTableViewProtocol.h"

@implementation GTArrayDataSource


#pragma mark - Initializer 

- (instancetype)init
{
    return [self initWithItems:nil
                     cellClass:[UITableViewCell class]
            configureCellBlock:nil];
    
    // Maybe better to make this method unuseable?
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunreachable-code"
    [self doesNotRecognizeSelector:_cmd];
    return nil;
#pragma clang diagnostic pop

}

- (instancetype)initWithItems:(NSArray *)items
                    cellClass:(Class)clazz
           configureCellBlock:(GTConfigureCellBlock)block
{
    if (self = [super init]) {
        
        NSAssert([clazz isSubclassOfClass:[UITableViewCell class]],
                 @"Cell class must be subclass of or identical to UITableViewCell");
        _items       = [items copy];
        _configBlock = [block copy];
        _cellClass   = clazz;
    }
    return self;
}

#pragma mark - Setters 
- (void)setCellClass:(Class)cellClass
{
    NSAssert([cellClass isSubclassOfClass:[UITableViewCell class]],
             @"Cell class must be subclass of or identical to UITableViewCell");
    _cellClass = cellClass;
}



// No need for the copy call, because we declared its attribute as 'copy'
//- (void)setItems:(NSArray *)items
//{
//    _items = [items copy];
//}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.cellClass)];
    if (!cell) {
        cell = [[self.cellClass alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:NSStringFromClass(self.cellClass)];
    }
    
    if ([cell conformsToProtocol:@protocol(GTTableViewCellProtocol)]) {
        
        id<GTTableViewCellProtocol> GTCell = (id<GTTableViewCellProtocol>)cell;
        [GTCell configureCellWithItem:self.items[indexPath.row]];
        
    }else if(self.configBlock){
        
        self.configBlock(cell,self.items[indexPath.row]);
        
    }else{
        
        NSAssert(0, @"To use GTArrayDataSource, you need to set cellClass that conforms to 'GTTableViewCellProtocol' or set a 'GTConfigureCellBlock' to set up the cell's content ");
        
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(dataSource:didInitializeCell:forTableView:atIndexPath:)]) {
        [self.delegate dataSource:self
                didInitializeCell:cell
                     forTableView:tableView
                      atIndexPath:indexPath];
    }
    
    return (UITableViewCell *)cell;
}

#pragma mark - Helper

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
{
    NSParameterAssert(indexPath.row < [self.items count]);
    return self.items[indexPath.row];
}



@end
