//
//  GTTableViewProtocol.h
//
//  Created by Jason on 15/4/9.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#ifndef JWProject_GTTableViewProtocol_h
#define JWProject_GTTableViewProtocol_h

#import <UIKit/UIKit.h>
// Protocol for subclass of UITableViewCell
typedef void(^GTTableViewCellSelectedBlock)(UITableView *tableView,
                                            NSIndexPath *indexPath);

@protocol GTTableViewCellProtocol <NSObject>

@required

- (void)configureCellWithItem:(id)item;

+ (CGFloat)cellHeightForItem:(id)item
          withRespectToWidth:(CGFloat)width;

@optional
@property (nonatomic, copy)GTTableViewCellSelectedBlock selectedResponse;
@end



// The delegate of the arrayDataSource
@class GTArrayDataSource;
@protocol GTTableViewDataSourceDelegate <NSObject>

@optional
- (void)dataSource:(GTArrayDataSource *)dataSource
 didInitializeCell:(id)cell
      forTableView:(UITableView *)tableView
       atIndexPath:(NSIndexPath *)indexPath;
@end


// The dataSource of the delegater.

@protocol GTTableViewDelegateDataSource <NSObject>

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
- (Class)cellClassAtIndexPath:(NSIndexPath *)indexPath;
@end



#endif
