//
//  AlgorithmMenuModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "AlgorithmMenuModel.h"

@interface AlgorithmMenuModel ()
@property(nonatomic, copy) NSArray *listArray;
@end

@implementation AlgorithmMenuModel
-(NSArray *)showData{
    return self.listArray;
}
- (NSArray *)listArray{
    if (!_listArray) {
        _listArray = @[
                                    @"基本算法思想",
                                    @"排序算法",
                                    @"查找算法"
                                    ];
    }
    return _listArray;
}
@end
