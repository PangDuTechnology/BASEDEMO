//
//  AlgorithmThoughtViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/16.
//

#import "AlgorithmThoughtViewModel.h"

@implementation AlgorithmThoughtViewModel
#pragma mark ------ AlgorithmViewModelDelegate
- (void)didSelectRowAtIndexPath:(id)indexPath pushController:(UIViewController *)pushController{
    SEL sel = NSSelectorFromString(@"setTableViewDataSource:");
    Class class = NSClassFromString(@"AlgorithmDetailViewController");
    UIViewController  *controller = [class new];
    [self.invocationViewModel performSelector:sel withArguments:@[indexPath] class:class object:controller];
    [pushController.navigationController pushViewController:controller animated:YES];
}
@end
