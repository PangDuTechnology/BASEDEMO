//
//  CreateAlgorithmModelsDelegate.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import <Foundation/Foundation.h>
@class AlgorithmViewModel,AlgorithmModel;
@protocol CreateAlgorithmModelsDelegate <NSObject>
@optional
- (AlgorithmViewModel *)createAlgorithmViewModelMethod;
- (AlgorithmModel *)createAlgorithmModelMethod;
- (NSArray *)createAlgorithmModelsMethod;
@end
