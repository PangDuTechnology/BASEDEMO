//
//  AlgorithmViewModel.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/8.
//

#import <Foundation/Foundation.h>
#import "AlgorithmViewModelDelegate.h"
#import "InvocationViewModel.h"
#import "ViewContrillerJumpViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AlgorithmViewModel : NSObject<AlgorithmViewModelDelegate>
@property(nonnull,nonatomic,strong,readonly) InvocationViewModel *invocationViewModel;
@property(nonnull,nonatomic,strong,readonly) ViewContrillerJumpViewModel  *jumpViewModel;
@end

NS_ASSUME_NONNULL_END
