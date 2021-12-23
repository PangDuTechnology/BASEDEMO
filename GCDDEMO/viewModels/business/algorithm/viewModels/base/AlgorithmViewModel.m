//
//  AlgorithmViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/8.
//

#import "AlgorithmViewModel.h"
#import "AlgorithmModel.h"
@interface AlgorithmViewModel ()
@property(nonnull,nonatomic,strong)  InvocationViewModel *invocationViewModel;
@end

@implementation AlgorithmViewModel
#pragma mark ------ property
- (InvocationViewModel *)invocationViewModel{
    if (!_invocationViewModel) {
        _invocationViewModel = [[InvocationViewModel alloc] init];
    }
    return _invocationViewModel;
}
@end
