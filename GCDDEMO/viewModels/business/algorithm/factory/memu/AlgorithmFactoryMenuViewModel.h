//
//  AlgorithmFactoryMenuViewModel.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CreateAlgorithmModelsDelegate.h"
#import "AlgorithmModelsMethodDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface AlgorithmFactoryMenuViewModel : NSObject<CreateAlgorithmModelsDelegate,AlgorithmModelsMethodDelegate>
@end

NS_ASSUME_NONNULL_END
