//
//  AlgorithmMenuViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "AlgorithmMenuViewModel.h"

@implementation AlgorithmMenuViewModel
- (void)didSelectRowAtIndexPathArray:(NSArray *)array pushController:(UIViewController *)pushController{
    SEL sel = NSSelectorFromString(@"setTableViewDataSource:");
    Class class = NSClassFromString(@"AlgorithmListViewController");
    UIViewController  *controller = [class new];
    [self.invocationViewModel performSelector:sel withArguments:array class:class object:controller];
    [pushController.navigationController pushViewController:controller animated:YES];
}
@end
