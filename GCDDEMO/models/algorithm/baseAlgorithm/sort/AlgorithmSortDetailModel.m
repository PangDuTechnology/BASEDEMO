//
//  AlgorithmSortDetailModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "AlgorithmSortDetailModel.h"

@interface AlgorithmSortDetailModel ()
@end

@implementation AlgorithmSortDetailModel
-(NSArray *)returnModelArray{
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
