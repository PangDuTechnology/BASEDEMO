//
//  ListViewModel.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/11/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListViewModel : NSObject
@property (nonatomic, strong)   NSArray *unLockArray;
@property(nonatomic, strong)    NSArray *commonArray;
- (void)didSelectRowAtIndexPath:(id)indexPath;
- (NSArray *)unLockRowShowTextAtIndexPath;
- (NSArray *)commonRowShowTextAtIndexPath;
@end

NS_ASSUME_NONNULL_END
