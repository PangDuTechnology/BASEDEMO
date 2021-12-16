//
//  CommonModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/11/3.
//

#import "CommonModel.h"

@interface CommonModel ()
@property (nonatomic, strong) NSArray *commonArray;
@end
@implementation CommonModel
- (NSArray *)rowShowText{
    return self.commonArray;
}
#pragma mark ------ property
- (NSArray *)commonArray{
    return @[@"子线程 + 主队列 + 同步",
                    @"主队列 + 异步 + 异步",
                    @"串行队列 + 同步 + 异步",
                    @"串行队列 + 异步 + 异步",
                    @"串行队列1同步 + 串行队列2同步",
                    @"串行队列1同步 + 串行队列2异步",
                    @"串行队列1异步 + 串行队列2同步",
                    @"串行队列1异步 + 串行队列2异步",
                    @"并发队列 + 同步 + 同步",
                    @"并发队列 + 同步 + 异步",
                    @"并发队列 + 异步 + 同步",
                    @"并发队列 + 异步 + 异步",
     ];
}
@end
