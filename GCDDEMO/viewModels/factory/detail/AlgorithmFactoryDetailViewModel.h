//
//  AlgorithmFactoryDetailViewModel.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/14.
//

#import <Foundation/Foundation.h>
#import "CreateAlgorithmModelsDelegate.h"
#import "AlgorithmModelsMethodDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlgorithmFactoryDetailViewModel : NSObject<CreateAlgorithmModelsDelegate,AlgorithmModelsMethodDelegate>

@end

NS_ASSUME_NONNULL_END
