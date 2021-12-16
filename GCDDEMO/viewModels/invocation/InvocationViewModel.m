//
//  InvocationViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "InvocationViewModel.h"

@implementation InvocationViewModel
- (id)performSelector:(SEL)aSelector withArguments:(NSArray *)arguments class:(Class) class object:(nonnull id)object{
    
    if (aSelector == nil) return nil;
    NSMethodSignature *signature = [class instanceMethodSignatureForSelector:aSelector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = object;
    invocation.selector = aSelector;
    // invocation 有2个隐藏参数，所以 argument 从2开始
    if ([arguments isKindOfClass:[NSArray class]]) {
        NSInteger count = MIN(arguments.count, signature.numberOfArguments - 2);
        for (int i = 0; i < count; i++) {
            const char *type = [signature getArgumentTypeAtIndex:2 + i];
            // 需要做参数类型判断然后解析成对应类型，这里默认所有参数均为OC对象
            if (strcmp(type, "@") == 0) {
                id argument = arguments[i];
                [invocation setArgument:&argument atIndex:2 + i];
            }
        }
    }
    
    [invocation invoke];
    
    id returnVal;
    if (strcmp(signature.methodReturnType, "@") == 0) {
        [invocation getReturnValue:&returnVal];
    }
    // 需要做返回类型判断。比如返回值为常量需要包装成对象，这里仅以最简单的`@`为例
    return returnVal;
}
@end
