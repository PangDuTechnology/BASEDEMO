//
//  AlgorithmFactoryListViewModel.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/11.
//

#import <Foundation/Foundation.h>
#import "CreateAlgorithmModelsDelegate.h"
#import "AlgorithmModelsMethodDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlgorithmFactoryListViewModel : NSObject<CreateAlgorithmModelsDelegate,AlgorithmModelsMethodDelegate>

@end

NS_ASSUME_NONNULL_END
