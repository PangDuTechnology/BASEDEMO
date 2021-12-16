//
//  UnLockModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/11/3.
//

#import "UnLockModel.h"

@interface UnLockModel ()
@property (nonatomic, strong) NSArray *titleArray;
@end
@implementation UnLockModel
#pragma mark ------ user method
- (NSArray *)rowShowText{
    return self.titleArray;
}
#pragma mark ------ property
- (NSArray *)titleArray{
    return @[@"主线程 + 主队列 + 同步",
                  @"主队列 + 异步 + 同步",
                 @"串行队列 + 同步 + 同步",
                @"串行队列 + 异步 + 同步"
                ];
}
@end
