//
//  AlgorithmSortDetailModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "AlgorithmSortDetailModel.h"

@interface AlgorithmSortDetailModel ()
@property(nonatomic, copy) NSArray *selectorArray;
@end

@implementation AlgorithmSortDetailModel
-(NSArray *)showData{
    return self.selectorArray;
}
- (NSArray *)selectorArray{
    return @[
                        @"bubbleSortAlgorithm",
                        
                        @"selectSortingAlgorithm",
                        
                        @"straightInsertionAlgorithm",
                        
                        @"shellSortAlgorithm",
                        
                        @"quickSortAlgorithm",
                        
                        @"heapSortAlgorithm",
                        
                        @"mergeSortAlgorithm"
                    ];
}
@end
