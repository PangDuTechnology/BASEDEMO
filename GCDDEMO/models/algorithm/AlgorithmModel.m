//
//  AlgorithmModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/8.
//

#import "AlgorithmModel.h"

@interface AlgorithmModel()
@property(nonatomic, copy) NSArray *titleArray;
@end

@implementation AlgorithmModel
-(NSArray *)showData{
    return self.titleArray;
}
#pragma mark ------ property
- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[];
    }
    return _titleArray;
}
@end
