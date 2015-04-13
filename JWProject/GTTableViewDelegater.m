//
//  GTTableViewDelegater.m
//
//  Created by Jason on 15/4/9.
//  Copyright (c) 2015年 JW Studio. All rights reserved.
//

#import "GTTableViewDelegater.h"
#import "GTTableViewProtocol.h"

@implementation GTTableViewDelegater


#pragma mark - Life Cycle
- (instancetype)init
{
    return [self initWithTableView:nil];
}

- (instancetype)initWithTableView:(UITableView *)tableView
{
    if (self = [super init]) {
        _tableView = tableView;
        _tableView.delegate = self;
    }
    return self;
}


#pragma mark - UITableViewDelegate
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;{
//    
//}
//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);{
//    
//}
//- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);{
//    
//}
//- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0);{
//    
//}
//- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);{
//    
//}
//
//- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0){
//    
//}
//
//// Variable height support
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{
    Class cellClassAtIndexPath = [self.dataSource cellClassAtIndexPath:indexPath];
    if (cellClassAtIndexPath) {
        return [cellClassAtIndexPath cellHeightForItem:[self.dataSource itemAtIndexPath:indexPath]
                    withRespectToWidth:tableView.bounds.size.width];
    }else{
        return 0;
    }
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;{
//    
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;{
//    
//}
//
//// Section header & footer information. Views are preferred over title should you decide to provide both
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;   // custom view for header. will be adjusted to default or specified header height
//{
//    
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;   // custom view for footer. will be adjusted to default or specified footer height
//{
//    
//}
//
//// Selection
//
//
//// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    // Give the cell a chance to update its appearance or animation.
    id<GTTableViewCellProtocol> cell = (id<GTTableViewCellProtocol>)[tableView cellForRowAtIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(selectedResponse)]) {
        if(cell.selectedResponse){
            cell.selectedResponse(tableView,indexPath);
        }
    }
    
    //This will be usefull when we wanna perform actions when user selected a cell.
    if(self.didSelectedBlock){
        self.didSelectedBlock(tableView,indexPath);
    }

}









@end
