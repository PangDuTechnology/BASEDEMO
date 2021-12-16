//
//  UnLockViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/11/2.
//

#import "UnLockViewModel.h"
@interface UnLockViewModel ()
@property (nonatomic, strong) NSDictionary *dictionary;
@end

@implementation UnLockViewModel
#pragma mark ------ user method
-(void)didSelectRowAtIndexPath:(id)indexPath{
    NSIndexPath *index = indexPath;
    NSString *strMethod = self.dictionary[[NSNumber numberWithInteger:index.row] ];
    SEL sel = NSSelectorFromString(strMethod);
    IMP imp = [self methodForSelector:sel];
    imp();
}
#pragma mark ------ 主线程 + 主队列 + 同步
- (void)mainQueueSync{
    NSLog(@"主线程 + 主队列 + 同步");
    dispatch_queue_t  mainQueue = dispatch_get_main_queue();
    dispatch_sync(mainQueue, ^{
        NSLog(@" 同步");
    });
}
#pragma mark ------ 主队列 + 异步 + 同步
-(void)mainQueueAsyncSync{
    NSLog(@"主队列 + 异步 + 同步");
    dispatch_queue_t  mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^{
        NSLog(@"异步");
        dispatch_sync(mainQueue, ^{
            NSLog(@"同步");
        });
        NSLog(@"主线程");
    });
}
#pragma mark ------ 串行队列 + 同步 + 同步
-(void)serialSyncSync{
    NSLog(@"串行队列 + 同步 + 同步");
    dispatch_queue_t  serialQueue = dispatch_queue_create("dispatch_serial_queue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(serialQueue, ^{
        NSLog(@"同步任务一");
        dispatch_sync(serialQueue, ^{
            NSLog(@"同步任务二");
        });
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"异步任务二");
    });
}
#pragma mark ------ 串行任务 + 异步 + 同步
-(void)serialAsyncSync{
    NSLog(@"串行任务 + 异步 + 同步");
    dispatch_queue_t  serialQueue = dispatch_queue_create("dispatch_serial_queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialQueue, ^{
        NSLog(@"同步任务一");
        dispatch_sync(serialQueue, ^{
            NSLog(@"同步任务二");
        });
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"异步任务二");
    });
}
#pragma mark ------ property
- (NSDictionary *)dictionary{
    if (!_dictionary) {
        _dictionary = @{
                        @0 : NSStringFromSelector(@selector(mainQueueSync)),
                        @1 : NSStringFromSelector(@selector(mainQueueAsyncSync)),
                        @2 : NSStringFromSelector(@selector(serialSyncSync)),
                        @3 : NSStringFromSelector(@selector(serialAsyncSync))
        };
    }
    return _dictionary;;
}
@end
