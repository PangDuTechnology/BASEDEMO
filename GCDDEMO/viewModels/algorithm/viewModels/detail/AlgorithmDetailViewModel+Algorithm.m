//
//  AlgorithmDetailViewModel+Algorithm.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/21.
//

#import "AlgorithmDetailViewModel+Algorithm.h"

@implementation AlgorithmDetailViewModel (Algorithm)
#pragma mark 冒泡排序
- (void) bubbleSortAlgorithm{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"45",@"89",@"12",@"34",@"90",@"19"]];
    for (NSInteger i = array.count;  i > 0; i--) {
        for (NSInteger j = 0; j < i-1; j++) {
            NSString *strNum;
            if ([array[j] intValue] > [array[j+1] intValue]) {
                strNum = array[j];
                array[j] = array[j+1];
                array[j+1] = strNum;
            }
        }
    }
    NSLog(@"冒泡排序======%@",array);
}
#pragma mark ------ 选择排序
- (void)selectSortingAlgorithm{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"45",@"34",@"12",@"7",@"67",@"90",@"23"]];
    for (NSInteger i = 0; i < array.count-1;  i++) {
        for (NSInteger j = i+1; j < array.count ; j++) {
            NSString *strNum;
            if ([array[i] intValue] > [array[j] intValue]) {
                strNum = array[i];
                array[i] = array[j];
                array[j] = strNum;
            }
        }
    }
    NSLog(@"选择排序======%@",array);
}
#pragma mark ------ 插入排序
- (void)straightInsertionAlgorithm{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"40",@"89",@"121",@"76",@"67",@"90",@"123"]];
    for (NSInteger i = 0; i < array.count; i++) {
        NSInteger j = i;
        while ( j > 0) {
            if ([array[j] integerValue] < [array [j-1] integerValue]) {
                NSString *strNum;
                strNum = array[j-1];
                array[j-1] = array[j];
                array[j] = strNum;
                j--;
            }else{
                break;
            }
        }
    }
    NSLog(@"插入排序======%@",array);
}
#pragma mark ------ 希尔排序
//最外层循环分解数组元素为多个序列,每次比较两数的间距,直到值为0循环结束
//下面一层循环按设置的间距gap,分别比较对应的数组元素,在该循环中使用插入排序法堆制定间距的元素排序
- (void)shellSortAlgorithm{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"400",@"189",@"1221",@"16",@"7",@"90",@"123",@"78"]];
    int len = (int)array.count;
    for (int gap = floor(len / 2); gap > 0; gap = floor(gap/2)) {
        for (int i = gap; i < len; i++) {
            for (int j = i - gap; j >= 0 && [array[j] integerValue] > [array[j+gap] integerValue]; j-=gap) {
                NSString *temp = array[j];
                array[j] = array[gap+j];
                array[gap+j] = temp;
            }
        }
    }
    NSLog(@"希尔排序======%@",array);
}
#pragma mark ------ 快速排序
- (void)quickSortAlgorithm{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"40",@"189",@"2345",@"8888",@"7",@"90",@"23",@"78"]];
    [AlgorithmDetailViewModel quickSort:array low:0 high:array.count-1];
    NSLog(@"快速排序======%@",array);
}
- (void)quickSortAlgorithmArray:(NSMutableArray *)array{
    [AlgorithmDetailViewModel quickSort:array low:0 high:array.count-1];
}
+ (void)quickSort:(NSMutableArray *)array low:(NSInteger)left high:(NSInteger)right{
    if (left >= right) {
        return;
    }
    NSInteger low = left;
    NSInteger hight = right;
    id key = array[low];
    while (low < hight) {
        while (low < hight && [array[hight] integerValue] >= [key integerValue]) {
            hight--;
        }
        if (low == hight) { // 当key是目前最小的数时，会出现low=hight的情况，
            break;
        }
        array[low++] = array[hight]; // low++ 会减少一次m[low]和key的比较
        while (low  <  hight && [array[low] integerValue] <= [key integerValue]) {
            low++;
        }
        if (low == hight) { // 当key是目前最大的数时(m[hight]的前面)，会出现low=hight的情况
            break;
        }
        array[hight--] = array[low]; //hight-- 会减少一次m[hight]和key的比较
    }
    array[low] = key;
    [self quickSort: array low: left high: low-1];
    [self quickSort: array low: low+1 high: right];
}
#pragma mark ------ 堆排序
/*
    大顶堆：arr[i] >= arr[2i+1] && arr[i] >= arr[2i+2]
    小顶堆：arr[i] <= arr[2i+1] && arr[i] <= arr[2i+2]
 */

/*
    步骤一 将无需序列构建成一个堆，根据升序降序需求选择大顶堆或小顶堆;

    步骤二 将堆顶元素与末尾元素交换，将最大元素"沉"到数组末端;

    步骤三重新调整结构，使其满足堆定义，然后继续交换堆顶元素与当前末尾元素，反复执行调整+交换步骤，直到整个序列有序。
 */
- (void)heapSortAlgorithm{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"30",@"18",@"234",@"88",@"70",@"90",@"23",@"78"]];
    [AlgorithmDetailViewModel heapSortAlgorithmArray:array];
    NSLog(@"堆排序======%@",array);
}
+ (void)heapSortAlgorithmArray:(NSMutableArray *)array{
    //构建大顶堆
    for (NSInteger i = array.count/2 - 1; i >= 0; i--) {
        //从第一个非叶子结点从下至上，从右至左调整结构
        [self adjustHeapArray:array start:i length:array.count];
    }
    //调整堆结构+交换堆顶元素与末尾元素
    for (NSInteger j = array.count -1; j >= 0; j--) {
        [self swapArray:array first:j second:0];
        [self adjustHeapArray:array start:0 length:j];
    }
}
//调整大顶堆
+ (void)adjustHeapArray:(NSMutableArray *)array
                  start:(NSInteger)start
                 length:(NSInteger)length{
    //取出当前元素
    NSString* strTemp = array[start];
    //从i结点的左子结点开始，也就是2i+1处开始
    for (NSInteger k = 2*start +1; k <length; k = 2*k + 1) {
        //如果左子结点小于右子结点，k指向右子结点
        if (k+1 < length && [array[k] integerValue] < [array [k+1] integerValue]) {
            k++;
        }
        //如果子节点大于父节点，将子节点值赋给父节点（不用进行交换
        if ([array[k] integerValue] > [strTemp integerValue]) {
            array[start] = array[k];
            start = k;
        }else{
            break;
        }
    }
    array[start] = strTemp;
}
//值交换
+ (void)swapArray:(NSMutableArray *)array
           first:(NSInteger)first
           second:(NSInteger)second{
    NSString *strTemp = array[first];
    array[first] = array[second];
    array[second] = strTemp;
}
#pragma mark ------ 归并排序
/**
 利用归并的思想实现的排序方法，该算法采用经典的分治（divide-and-conquer）策略（分治法将问题分(divide)成一些小的问题然后递归求解，而治(conquer)的阶段则将分的阶段得到的各答案"修补"在一起，即分而治之)。

 */
- (void)mergeSortAlgorithm{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"30",@"18",@"234",@"88",@"2345",@"1",@"9999"]];
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    [AlgorithmDetailViewModel mergeSortArray:array newArray:newArray left:0 right:array.count - 1 ];
    NSLog(@"排序前======%@",array);
    NSLog(@"归并排序递归调用====== %@",newArray);
    [AlgorithmDetailViewModel mergeSortConventional:array sortArray:newArray];
    NSLog(@"归并排序常规方式======%@",newArray);
}
+(void)mergeSortArray:(NSMutableArray *)array
             newArray:(NSMutableArray *)newArray
                 left:(NSInteger)left
                right:(NSInteger)right{
    if (left < right) {
        NSInteger mid = (left + right) / 2;
        //左边归并排序，使得左子序列有序
        [self mergeSortArray:array newArray:newArray left:0 right:mid];
        //右边归并排序，使得右子序列有序
        [self mergeSortArray:array newArray:newArray left:mid + 1 right:right];
        //将两个有序子数组合并操作
        [self mergeArray:array newArray:newArray left:left right:right mid:mid];
    }
}
+ (void)mergeArray:(NSMutableArray *)array newArray:(NSMutableArray*)newArray
              left:(NSInteger)left right:(NSInteger)right mid:(NSInteger)mid{
    NSInteger i = left; //左序列指针
    NSInteger j = mid + 1; //右序列指针
    NSInteger m = 0;
    while (i <= mid && j <= right) {
        if ([array[i] integerValue] <= [array[j] integerValue]) {
            newArray[m++] = array[i++];
        }else{
           newArray[m++] = array[j++];
        }
    }
    //将左边剩余元素填充进newArray中
    while (i <= mid) {
        newArray[m++] = array[i++];
    }
    //将右序列剩余元素填充进newArray中
    while (j <= right) {
        newArray[m++] = array[j++];
    }
    m = 0;
    //将newArray中的元素全部拷贝到原数组中
    while(left <= right){
        array[left++] = newArray[m++];
    }
}
//归并排序非递归调用
+ (void)mergeSortConventional:(NSMutableArray *)array sortArray:(NSMutableArray *)sortArray{
    NSInteger interval = 1;//初始子表长度为1
    while (interval < array.count) {
        [self mergePassConventional:array sortArray:sortArray interval:interval lenth:array.count];
        interval *=2;
//        //确保我们将序列归并排序后的数据一定是保存在数组array中
//        [self mergePassConventional:sortArray sortArray:array interval:interval lenth:array.count];
//        interval *=2;
    }
}
//将array中相邻长度为
+ (void)mergePassConventional:(NSMutableArray *)array                    sortArray:(NSMutableArray *)sortArray
                     interval:(NSInteger)interval
                        lenth:(NSInteger)lenth{
    NSInteger i = 0;
    NSInteger j;
    for (; i <= lenth - 2*interval;  i = i+2*interval) {
        [self mergeArray:array sortArray:sortArray left:i right:i+interval-1 rightEnd:i+2*interval-1];
    }
    if (i < lenth-interval) {
        [self mergeArray:array sortArray:sortArray left:i right:i+interval-1 rightEnd:lenth];
    }else{
        for (j = i; j < lenth; j++) {
            sortArray[j] = array[j];
        }
    }
}
+ (void)mergeArray:(NSMutableArray *)array sortArray:(NSMutableArray *)sortArray left:(NSInteger)left right:(NSInteger)right rightEnd:(NSInteger)n{
    NSInteger j,k;
    for (j = right+1,k=left; left<=right && j <=n;  k++) {//将array中记录由小到大并入sortArray
        if ([array[left] integerValue] <[array[j] integerValue] ) {
            sortArray[k] = array[left++];
        }else{
            sortArray[k] = array[j++];
        }
    }
    if (left <= right) {                         //  将剩余的array[i..m]复制到sortArray
        for (; left<=right-left; left++) {
            sortArray[k++] = array[left];
        }
    }
    if (j <= n) {                         //  将剩余的array[j..m]复制到sortArray
        for (; j <= n-j; j++ ) {
            sortArray[k++] = array[j];
        }
    }
}
@end
