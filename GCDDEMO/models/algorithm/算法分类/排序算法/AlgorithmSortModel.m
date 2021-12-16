//
//  AlgorithmSortModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "AlgorithmSortModel.h"

@interface AlgorithmSortModel()
@property (nonatomic, copy) NSArray *sortArray;
@end

@implementation AlgorithmSortModel
-(NSArray *)showData{
    return self.sortArray;
}
#pragma mark ------ property
- (NSArray *)sortArray{
    if (!_sortArray) {
        _sortArray = @[
                                        @"冒泡排序",
                                        @"选择排序",
                                        @"插入排序",
                                        @"希尔排序",
                                        @"快速排序",
                                        @"堆排序",
                                        @"归并排序"
                                        ];
    }
    return _sortArray;
}
@end
