//
//  SceneDelegateViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/11/19.
//

#import "SceneDelegateViewModel.h"

@interface SceneDelegateViewModel ()
@property (nonatomic ,copy) NSArray *controllerArray;
@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, strong) UITabBarController *tabBarController;
@end
@implementation SceneDelegateViewModel
- (UIViewController *)rooterController{
    return self.tabBarController;
}
- (NSArray *)returnControllers{
    __block NSMutableArray *array = [[NSMutableArray alloc] init];
    [self.titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Class class = NSClassFromString(self.controllerArray[idx]);
        UIViewController *controller = [class new];
        controller.navigationItem.title = obj;
        controller.title = obj;
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        [array addObject:navigationController];
    }];
    return array;
}
#pragma mark ------ property
- (NSArray *)titleArray{
    return @[   @"Algorithm",
                        @"Lock",
                        @"Socket"
    ];
}
- (NSArray *)controllerArray{
    return @[   @"AlgorithmViewController",
                        @"ListViewController",
                        @"SocketViewController"
    ];
}
- (UITabBarController *)tabBarController{
    if (!_tabBarController) {
        _tabBarController = [[UITabBarController alloc] init];
        _tabBarController.viewControllers = [self returnControllers];
    }
    return _tabBarController;
}
@end
