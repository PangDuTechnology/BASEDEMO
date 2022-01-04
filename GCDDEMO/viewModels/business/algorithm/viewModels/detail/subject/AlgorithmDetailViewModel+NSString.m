//
//  AlgorithmDetailViewModel+NSString.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/24.
//

#import "AlgorithmDetailViewModel+NSString.h"

@implementation AlgorithmDetailViewModel (NSString)
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
#pragma mark ------ 二个字符串是否为旋转词
- (void)isRotationAlgorithm{
    NSLog(@"二个字符串是否为旋转词: %d",[AlgorithmDetailViewModel isRotationAlgorithmArray:@[@"12345",@"34512"]]);
}
+ (BOOL)isRotationAlgorithmArray:(NSArray *)array{
    if (array.count < 2) {
        return false;
    }
    NSString *strLeft = array[0];
    NSString *strRight = array[1];
    if (strLeft ==nil ||strRight ==nil || strLeft.length != strRight.length) {
        return false;
    }
    NSString *strLong = [strRight stringByAppendingString:strRight];
    if ([strLong containsString:strLeft]) {
        return YES;
    }
    return false;
}
#pragma mark ------ 将整数字符串转换成整数值
-  (void)convertAlgorithm{
    // INT_MIN 在 : -2147483648 ~ 2147483647 之间
    NSInteger  number = [AlgorithmDetailViewModel convertAlgorithmString:@"-2147483648"];
    NSLog(@"整数字符串转整数值:%ld",(long)number);
}
+ (NSInteger)convertAlgorithmString:(NSString *)string{
    if (string == nil || [string isEqual:@""]) {
        return 0;
    }
    if (![AlgorithmDetailViewModel isValid:string]) {
        return 0;
    }
    bool posi = [string characterAtIndex:0] == '-'  ? false : true;
    NSInteger minq = INT_MIN / 10;  // INT_MIN = -2147483648
    NSInteger minr  = INT_MIN % 10;
    NSInteger result = 0;
    NSInteger cur = 0;
    for (NSInteger i = posi ? 0 :1; i < string.length; i++) {
        cur = '0' - [string characterAtIndex:i];
        //result == minq && cur < minr :  出现-2147483649时
        if ((result < minq) || (result == minq && cur < minr)) {
            return 0;
        }
        result = result * 10 + cur;
    }
    if (posi && result == INT_MIN ) {
        return 0;
    }
    return posi ? -result : result;
}
+ (BOOL)isValid:(NSString *)string{
    char one = [string characterAtIndex:0];
    if (one != '-' && (one < 0 || one >9)) {
        return false;
    }
    if (one == '-' && (string.length == 1 || [string characterAtIndex:1] == 0)) {
        return  false;
    }
    if (one == '0' && string.length > 1) {
        return false;
    }
    for (NSInteger i = 1; i < string.length; i++) {
        if ([string characterAtIndex:i] < '0' || [string characterAtIndex:i] > '9') {
            return false;
        }
    }
    return true;
}
#pragma mark ------数字子串的求和
- (void)allNumbersSumAlgorithm{//
    NSInteger result = [AlgorithmDetailViewModel allNumbersSumAlgorithmString:@"1K-100ABC500D-T--100F200G!!100H---300"];
    NSLog(@"数字子串的和: %ld",(long)result);
}
+ (NSInteger)allNumbersSumAlgorithmString:(NSString *)string{
    if (string == nil ||[string isEqualToString:@""]) {
        return 0;
    }
    bool posi = true;
    NSInteger  result = 0;
    NSInteger num = 0;
    NSInteger cur = 0;
    for (NSInteger i = 0; i < string.length; i++) {
        cur = [string characterAtIndex:i] - '0';
        if (cur < 0 || cur > 9) {
            result += num;
            num = 0;
            if ([string characterAtIndex:i] == '-') {
                if (i - 1 > -1 && [string characterAtIndex:i-1] == '-') {
                    posi = !posi;
                }else{
                    posi = false;
                }
            }
        }else{
            num = num * 10 + (posi ? cur : -cur);
        }
    }
    result += num;
    return result;
}
#pragma mark ------ 去除字符串中连续出现的k个0的子串
- (void)removeKZerosAlgorithm{
    NSString *string = [AlgorithmDetailViewModel removeKZerosAlgorithmString:@"A0000B000" num:3];
    NSLog(@"去除字符串中连续出现的子串===%@",string);
}
+ (NSString *)removeKZerosAlgorithmString:(NSString *)string num:(NSInteger)num{
    if (string == nil || [string isEqualToString:@""]) {
        return string;
    }
    if (num < 1) {
        return string;
    }
    NSMutableString *mutable = [[NSMutableString alloc] initWithString:string];
    NSInteger count = 0, start = -1;
    for (NSInteger i = 0; i < string.length; i++) {
        if ([string characterAtIndex:i] == '0') {
            count++;
            start = (start == -1 ? i :start );
        }else{
            if (count == num) {
              [mutable  deleteCharactersInRange:NSMakeRange(start, num)];
            }
            count =0;
            start = -1;
        }
    }
    if (count == num) {
        [mutable  deleteCharactersInRange:NSMakeRange(start, num)];
        count =0;
        start = -1;
    }
    return mutable;
}
#pragma mark ------ 替换字符串中连续出现的制定字符串
- (void)replaceStringAlgorithm{
    NSString *string = [AlgorithmDetailViewModel  replaceStringAlgorithmString:@"abc123abcabc@@abc" from:@"abc" to:@"x"];
    NSLog(@"替换后字符串: %@",string);
}
+ (NSString *)replaceStringAlgorithmString:(NSString*)strSrc
                                from:(NSString *)strFrom
                                  to:(NSString *)strTo{
    if (strSrc == nil || strFrom == nil  || strTo == nil || [strSrc  isEqualToString:@""] || [strFrom isEqualToString:@""]||[strTo isEqualToString:@""]) {
        return strSrc;
    }
    if (![strSrc containsString:strFrom]) {
        return  strSrc;
    }
    NSMutableString *string = [[NSMutableString alloc] initWithString:strSrc];
    NSInteger tolength = strFrom.length;
    NSString *strSpace = @" ";
    for (NSInteger j = 0; j < strFrom.length-1; j++) {
        strSpace =  [strSpace stringByAppendingString:@" "];
    }
    NSInteger i = 0;
    for (; i < string.length; i++) {
        if ([string characterAtIndex:i] == [strFrom characterAtIndex:0]) {
            if (i+tolength <= string.length) {
                NSString *str = [string substringWithRange:NSMakeRange(i, tolength)];
                if ([str isEqualToString:strFrom]) {
                    [string replaceCharactersInRange:NSMakeRange(i, tolength) withString:strSpace];
                    i = i - 1 + tolength;
                }
            }
        }
    }
    for (NSInteger j = 0; j < string.length; j++) {
        if ([string characterAtIndex:j] == 32 ) {
                if (j+tolength <= string.length) {
                    NSString *str = [string substringWithRange:NSMakeRange(j, tolength)];
                    if ([str isEqualToString:strSpace]) {
                        [string replaceCharactersInRange:NSMakeRange(j, tolength) withString:strTo];
                        break;
                    }
                }
        }
    }
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}
#pragma mark ------ 字符串的统计字符串
- (void)getCountStringAlgorithm{
    NSString *string = [AlgorithmDetailViewModel getCountStringAlgorithmString:@"aaabbadddffccc"];
    NSLog(@"字符串的统计字符串: %@",string);
    char ch = [AlgorithmDetailViewModel getCharAtIndexAlgorithm:130 string:@"a_100_b_20_c_45_d_1"];
    NSLog(@"所在位置字符为: %c",ch);
}
+(NSString *)getCountStringAlgorithmString:(NSString *)string{
    if (string == nil || [string isEqualToString:@""]) {
        return string;
    }
    NSString *strRes = [string substringToIndex:1];
    NSInteger num = 1;
    for (NSInteger i = 1; i < string.length; i++) {
        if ([string characterAtIndex:i] != [string characterAtIndex:i-1]) {
            strRes = [strRes stringByAppendingFormat:@"_%ld_%c",(long)num,[string characterAtIndex:i]];
            num = 1;
        }else{
            num++;
        }
    }
    return [strRes stringByAppendingFormat:@"_%ld",(long)num];
}
+ (char)getCharAtIndexAlgorithm:(NSInteger )index string:(NSString *)string{
    if (string == nil || [string isEqualToString:@""]) {
        return '\0';
    }
    if (index < 0) {
        return '\0';
    }
    char ch = '\0';
    bool stage = true;
    NSInteger sum = 0;
    NSInteger num = 0;
    for (NSInteger i = 0; i < string.length; i++) {
        if ([string characterAtIndex:i] == '_') {
            stage = !stage;
        }else if (stage){
            sum += num;
            if (sum > index) {
                return ch;
            }
            num = 0;
            ch = [string characterAtIndex:i];
        }else{
            num = num * 10 + [string characterAtIndex:i] - '0';
        }
    }
    return sum + num > index ? ch : '0';
}
#pragma mark ------ 判断字符串中所有字符是否出现一次
- (void)isUniqueStringAlgorithm{
    
}
@end
