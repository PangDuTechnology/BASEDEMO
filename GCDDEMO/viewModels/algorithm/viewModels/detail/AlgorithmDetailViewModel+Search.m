//
//  AlgorithmDetailViewModel+Search.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/22.
//

#import "AlgorithmDetailViewModel+Search.h"
#include <objc/message.h>
@implementation AlgorithmDetailViewModel (Search)
#pragma mark ------ 顺序查找
- (void)orderFindAlgorithm{
    NSInteger num= 59;
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < 200; i++) {
        [array addObject:@(i)];
    }
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *number = obj;
        if ([number integerValue] == num) {
            NSLog(@"位置 i===%ld",(long)idx);
            *stop = YES;
        }
    }];
}
#pragma mark ------ 折半查找
- (void)splitHalfSearchAlgorithm{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < 20; i++) {
        [array addObject:@(arc4random()%20)];
    }
    NSLog(@"排序前===%@",array);
    Class class = NSClassFromString(@"AlgorithmDetailViewModel");
    SEL sel = NSSelectorFromString(@"quickSortAlgorithmArray:");
    if (![class instancesRespondToSelector:sel]) {
        return;
    }
    int (*action)(id, SEL, id) = (int (*)(id, SEL, id)) objc_msgSend;
    action([class new], sel, array);
    NSLog(@"排序后===%@",array);
    NSLog(@"数组中有%ld个",(long)[AlgorithmDetailViewModel splitHalfSearchAlgorithmArray:array search:15]);
}
+ (NSInteger)splitHalfSearchAlgorithmArray:(NSMutableArray*)array search:(NSInteger)number{
    NSInteger low=0,mid=0,high= array.count -1;
    NSInteger count = 0;
    while (low <= high) {
        mid = (low + high)/2;
        if ([array[mid] integerValue] == number) {
            count++;
            return count;
        }else if([array[mid] integerValue] > number){
            high = mid -1;
        }else{
            low = mid +1;
        }
    }
    return -1;
}
@end
