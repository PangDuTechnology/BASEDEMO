//
//  AlgorithmDetailViewModel+AlgorithmThought.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/21.
//

#import "AlgorithmDetailViewModel+AlgorithmThought.h"

@implementation AlgorithmDetailViewModel (AlgorithmThought)
#pragma mark ------ 穷举算法思想
/**
第一步:对于一种可能情况计算其结果
第二步:判断其结果是否满足要求,若不满足继续执行第一步直到满足要求
 */
- (void)exhaustiveAttackMethod{
    NSInteger head = 35;
    NSInteger foot = 94;
    NSInteger chicken = 0;
    NSInteger rabbit = 0;
    NSInteger i ,j;
    for ( i = 0; i <= head; i++) {
        j = head - i;
        if ((i *2 + j * 4) == foot) {
            chicken = i;
            rabbit = j;
        }
    }
    NSLog(@"鸡有%ld只,兔有%ld只",(long)chicken,(long)rabbit);
}
#pragma mark ------ 递推算法思想
/**
 (1)、根据已知结果和关系,求解中间结果
 (2)、判断是否达到要求,若没有达到,继续根据已知结果和关系求解中间结果,以此循环直到找到正确答案
 */
- (void)arecursiveAlgorithmMethod{
 NSInteger count = [AlgorithmDetailViewModel fibonacciMethod:36];
    NSLog(@"斐波那切数列 ======%ld",(long)count);
}
+ (NSInteger)fibonacciMethod:(NSInteger)mouth{
    NSInteger num1,num2;
    if (mouth == 1 || mouth == 2) {
        return 1;
    }
    num1 = [self fibonacciMethod:mouth - 1];
    num2 = [self fibonacciMethod:mouth - 2];
    return num1 + num2;
}
@end
