//
//  ListViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/11/3.
//

#import "ListViewModel.h"
#import "CommonModel.h"
#import "UnLockModel.h"
@interface ListViewModel ()
@property (nonatomic, strong)  CommonModel *commonModel;
@property (nonatomic, strong)  UnLockModel   *unLockModel;
@property (nonatomic, strong)   id    queueModel;
@end
@implementation ListViewModel
#pragma mark ------ user method
- (void)didSelectRowAtIndexPath:(id)indexPath{
    [self.queueModel didSelectRowAtIndexPath:indexPath];
}
- (NSArray *)unLockRowShowTextAtIndexPath{
    return [self.unLockModel rowShowText];
}
- (NSArray *)commonRowShowTextAtIndexPath{
    return [self.commonModel rowShowText];
}
#pragma mark ------ property
- (id)queueModel{
    if (!_queueModel) {
        Class class = NSClassFromString(@"QueueViewModel");
        _queueModel = [class new];
    }
    return _queueModel;;
}
- (CommonModel *)commonModel{
    if (!_commonModel) {
        _commonModel = [[CommonModel alloc] init];
    }
    return _commonModel;;
}
- (UnLockModel *)unLockModel{
    if (!_unLockModel) {
        _unLockModel = [[UnLockModel alloc] init];
    }
    return _unLockModel;
}
- (NSArray *)unLockArray{
    if (!_unLockArray) {
        _unLockArray = [NSArray arrayWithArray:[self.unLockModel rowShowText]];
    }
    return _unLockArray;
}
- (NSArray *)commonArray{
    if (!_commonArray) {
        _commonArray = [NSArray arrayWithArray:[self.commonModel rowShowText]];
    }
    return _commonArray;
}
@end
