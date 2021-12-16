//
//  QueueViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/11/3.
//

#import "QueueViewModel.h"
@interface QueueViewModel ()
@property (nonatomic ,strong) id commonViewModel;
@property (nonatomic, strong) id unLockViewModel;
@end

@implementation QueueViewModel
-(void)didSelectRowAtIndexPath:(id)indexPath{
    NSIndexPath *index = indexPath;
    QueueViewModel *viewModel = nil;
    switch (index.section) {
        case 0:
            viewModel = self.unLockViewModel;
            break;
        case 1:
            viewModel = self.commonViewModel;
            break;
        default:
            break;
    }
    [viewModel didSelectRowAtIndexPath:indexPath];
}
#pragma mark ------ property
- (id)commonViewModel{
    if (!_commonViewModel) {
        Class class = NSClassFromString(@"CommonViewModel");
        _commonViewModel = [class new];
    }
    return  _commonViewModel;
}
- (id)unLockViewModel{
    if (!_unLockViewModel) {
        Class class = NSClassFromString(@"UnLockViewModel");
        _unLockViewModel = [class new];
    }
    return _unLockViewModel;
}
@end
