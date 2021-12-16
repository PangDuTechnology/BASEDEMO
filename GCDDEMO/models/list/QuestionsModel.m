//
//  QuestionsModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/11/10.
//

#import "QuestionsModel.h"

@implementation QuestionsModel
#pragma mark ------ One
/**
 打印结果为 1、3。原因是：
 performSelector:withObject:afterDelay: 的本质是拿到当前线程的 RunLoop 往它里面添加 timer
 RunLoop 和线程是一一对应关系，子线程默认没有开启 RunLoop
 当前 performSelector:withObject:afterDelay: 在子线程执行
 所以 2 不会打印。
*/
- (void)interviewQuestionsOne{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1");
        [self performSelector:@selector(testOne) withObject:nil afterDelay:.0];
        NSLog(@"3");
       // [[NSRunLoop currentRunLoop] run];  若要打印：2  需开启当前线程runloop
    });
}
- (void)testOne {
    NSLog(@"2");
}
@end
