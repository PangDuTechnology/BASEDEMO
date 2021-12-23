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
- (void)recursionAlgorithmMethod{
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
#pragma mark ------ 递归算法
-(void)arecursiveAlgorithmMethod{
    NSInteger factorial = [AlgorithmDetailViewModel factMethod:12];
    NSLog(@"12的阶乘为: %ld",(long)factorial);
}
+(NSInteger)factMethod:(NSInteger)number{
    if (number <= 1) {
        return 1;
    }
    return number * [self factMethod:number - 1];
}
#pragma mark ------ 分治算法思想
/**
    第一步:规模为N的问题,分解为M个规模较小的子问题,子问题互相独立,与原问题形式相同。
    第二步:递归求解各个子问题。
    第三步:将各个子问题的解合并得到原问题的解
 */
- (void)divideConquerAlgorithm{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i <100 ; i++) {
        if (i == 34) {
            [array addObject:@"1"];
        }else{
            [array addObject:@"2"];
        }
    }
    NSInteger low = 0;
    NSInteger hight = array.count-1;
    [AlgorithmDetailViewModel falseCoinArray:array low:low hight:hight];
}
+(void)falseCoinArray:(NSMutableArray *)array
                       low:(NSInteger)low
                     hight:(NSInteger )hight{
    NSInteger divide =0;
    NSInteger leftSum=0,rightSum=0;
    if (low + 1 == hight) {
        if ([array[low] integerValue] < [array[hight] integerValue]) {
            divide = low + 1;
            NSLog(@"位置%ld不符合标准的配件",(long)divide);
            return;
        }else{
            divide = hight + 1;
            NSLog(@"位置%ld不符合标准的配件",(long)divide);
            return;
        }
    }
    
    if ((hight - low + 1)%2 == 0) { //偶数个
        for (NSInteger i = low; i <=low+ (hight - low) /2 ; i++) {//左半段
            leftSum += [array[i] integerValue];
        }
        for (NSInteger i =low+ (hight-low)/2+1 ; i<= hight; i++) {//右半段
            rightSum +=  [array[i] integerValue];
        }
        if (leftSum > rightSum) {//在右边
            [self falseCoinArray:array low:low+(hight-low)/2+1 hight:hight];
        }else if(leftSum < rightSum){//在左边
             [self falseCoinArray:array low: low hight: (low+(hight-low)/2)];
        }
    }else{//奇数个
        for (NSInteger i = low; i <= low+ (hight - low) /2 -1; i++) {//左半段
            leftSum +=  [array[i] integerValue];
        }
        for (NSInteger i = low+(hight-low)/2+1 ; i<=hight; i++) {//右半段
            rightSum += [array[i] integerValue];
        }
        if(leftSum > rightSum){
            [self falseCoinArray:array low:low+ (hight - low)/2+1 hight:hight];
        }else if(leftSum < rightSum){
            [self falseCoinArray:array low: low hight:(low+(hight-low)/2-1)];
        }else{
            divide = low + (hight - low)/2 +1;
            NSLog(@"位置%ld不符合标准的配件",(long)divide);
            return;
        }
    }
}
#pragma mark ------ 概率算法思想
/**
 第一步:将问题转化为相应的几何图形S,结果包含在其中某一部分S1的面积
 第二步:向几何图形中随机撒点
 第三步:统计几何图形S和S1中的点数。根据S面积和S1面积的关系以及各图形中的点数计算结果
 第四步:判断上述结果是否在需要精度内,若为达到执行第二步,直到达到精度输出近似值
                                            数值概率算法  拉斯维加斯概率算法  舍伍德概率算法
    蒙特卡罗概率算法(常用)
 */
- (void)probabilityAlgorithm{
  double pi = [AlgorithmDetailViewModel montePI:20000];
    NSLog(@"蒙特卡罗概率算法: %f",pi);
}
+ (double)montePI:(NSInteger)n{
    double pi;
    double x,y;
    NSInteger i,sum=0;
    for (i = 1; i < n; i++) {
        x = (double)rand()/RAND_MAX;
        y = (double)rand()/RAND_MAX;
        if ((x*x + y*y) <= 1) {
            sum++;
        }
    }
    pi = 4.0 *sum/n;
    return pi;
}
#pragma mark ------ 贪心算法
- (void)greedyAlgorithm{
    NSInteger userCoin = 127;
    NSInteger fiveCoin=0,twoCoin=0,oneCoin=0;
    while (userCoin >= 5) {
        userCoin -=5;
        fiveCoin++;
    }
    while (userCoin >= 2) {
        userCoin-=2;
        twoCoin++;
    }
    while (userCoin >= 1) {
        userCoin-=1;
        oneCoin++;
    }
    NSLog(@"五元硬币数:%ld",(long)fiveCoin);
    NSLog(@"二元硬币数:%ld",(long)twoCoin);
    NSLog(@"一元硬币数:%ld",(long)oneCoin);
}
@end
