//
//  AlgorithmViewModel.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AlgorithmViewModelDelegate.h"
#import "InvocationViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AlgorithmViewModel : NSObject<AlgorithmViewModelDelegate>
@property(nonnull,nonatomic,strong,readonly) InvocationViewModel *invocationViewModel;
@end

NS_ASSUME_NONNULL_END
