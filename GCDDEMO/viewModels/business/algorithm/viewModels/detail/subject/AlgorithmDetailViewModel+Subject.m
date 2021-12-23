//
//  AlgorithmDetailViewModel+Subject.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/23.
//

#import "AlgorithmDetailViewModel+Subject.h"

@implementation AlgorithmDetailViewModel (Subject)
#pragma mark ------ 逆置字符串
- (void)invertedStringAlgorithm{
    NSLog(@"原字符串===%@",@"qwertyuiop");
    NSLog(@"字符串倒置===%@",[AlgorithmDetailViewModel reverseStringMethod:@"qwertyuiop"]);
    NSLog(@"字符串倒置异或===%@",[AlgorithmDetailViewModel reverseStringExclusiveMethod:@"qwertyuiop"]);
}
+ (NSString *)reverseStringMethod:(NSString *)string{
    NSMutableString *mutable = [[NSMutableString alloc]initWithString:string];
    NSInteger lengh = mutable.length - 1;
    int n = 0;
    NSString *strTemp;
    while ( n < lengh) {
        strTemp = [mutable substringWithRange:NSMakeRange(n, 1)];
        [mutable replaceCharactersInRange:NSMakeRange(n,1) withString: [mutable substringWithRange:NSMakeRange(lengh, 1)]];
       [mutable replaceCharactersInRange:NSMakeRange(lengh, 1) withString:strTemp];
        n++;
        lengh--;
    }
    return mutable;
}
+ (NSString *)reverseStringExclusiveMethod:(NSString *)string{
    char s[string.length*2];
    memcpy(s, [string cStringUsingEncoding:NSASCIIStringEncoding], 2*[string length]);
    NSInteger lengh = string.length-1;
    int n = 0;
    while ( n < lengh) {
        s[n] = s[n] ^ s[lengh];
        s[lengh] = s[n] ^ s[lengh];
        s[n] = s[n] ^ s[lengh];
        n++;
        lengh--;
    }
    return [NSString stringWithCString:s encoding:NSUTF8StringEncoding];
}
#pragma mark ------ 两个字符串是否为变形词
- (void)isDeformationAlgorithm{
    NSLog(@"二个字符串是否是变形词%d",[AlgorithmDetailViewModel isDeformationAlgorithmArray:@[@"psa",@"asd"]]);
}
+ (BOOL)isDeformationAlgorithmArray:(NSArray *)array{
    if (array.count < 2) {
        return false;
    }
    NSString *strLeft = array[0];
    NSString *strRight = array[1];
    if (strLeft.length != strRight.length) {
        return false;
    }
    char s[65535];
    for (NSInteger i = 0; i < strLeft.length; i++) {
            NSInteger a = [strLeft characterAtIndex:i];
            s[a]++;
    }
    for (NSInteger i = 0; i < strRight.length; i++) {
        NSInteger a = [strRight characterAtIndex:i];
        if (s[a]-- == 0) {
            return false;
        }
    }
    return true;
}
@end
