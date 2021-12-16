//
//  AlgorithmMenuViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "AlgorithmMenuViewModel.h"

@implementation AlgorithmMenuViewModel
- (void)didSelectRowAtIndexPath:(id)indexPath pushController:(UIViewController *)pushController{
    SEL sel = NSSelectorFromString(@"setTableViewDataSource:");
    Class class = NSClassFromString(@"AlgorithmListViewController");
    UIViewController  *controller = [class new];
    [self.invocationViewModel performSelector:sel withArguments:@[indexPath] class:class object:controller];
    [pushController.navigationController pushViewController:controller animated:YES];
}
@end
