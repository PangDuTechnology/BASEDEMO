//
//  AlgorithmModelDelegate.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AlgorithmModelDelegate <NSObject>
@optional
-(NSArray *)returnModelArray;
-(NSDictionary *)returnModelDicionary;
@end

NS_ASSUME_NONNULL_END
