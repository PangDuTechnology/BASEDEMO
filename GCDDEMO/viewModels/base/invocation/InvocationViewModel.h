//
//  InvocationViewModel.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InvocationViewModel : NSObject
- (id)performSelector:(SEL)aSelector
        withArguments:(NSArray *)arguments
        class:(Class) class object:(id)object;
@end

NS_ASSUME_NONNULL_END
