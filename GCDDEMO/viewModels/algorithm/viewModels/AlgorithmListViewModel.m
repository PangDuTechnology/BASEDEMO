//
//  AlgorithmListViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "AlgorithmListViewModel.h"

@implementation AlgorithmListViewModel
#pragma mark ------ AlgorithmViewModelDelegate
- (void)didSelectRowAtIndexPathArray:(NSArray *)array pushController:(UIViewController *)pushController{
    SEL sel = NSSelectorFromString(@"setTableViewDataSource:");
    Class class = NSClassFromString(@"AlgorithmDetailViewController");
    UIViewController  *controller = [class new];
    [self.invocationViewModel performSelector:sel withArguments:array class:class object:controller];
    [pushController.navigationController pushViewController:controller animated:YES];
}
@end
