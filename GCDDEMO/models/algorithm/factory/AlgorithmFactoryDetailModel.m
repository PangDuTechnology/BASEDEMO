//
//  AlgorithmFactoryDetailModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/23.
//

#import "AlgorithmFactoryDetailModel.h"

@implementation AlgorithmFactoryDetailModel
-(NSDictionary *)returnModelDicionary{
    return @{
        @"AlgorithThoughtModel":@"AlgorithmSortThoughtModel",
        
        @"AlgorithmSortModel": @"AlgorithmSortDetailModel",
        
        @"AlgorithmSearchModel" : @"AlgorithmSearchDetailModel",
        
        @"AlgorithmSubjectModel":   @"AlgorithmSubjectDetailModel"
    };
}
@end
