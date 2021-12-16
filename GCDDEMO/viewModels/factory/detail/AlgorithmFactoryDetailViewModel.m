//
//  AlgorithmFactoryDetailViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/14.
//

#import "AlgorithmFactoryDetailViewModel.h"
#import "AlgorithmDetailViewModel.h"
#import "AlgorithmSortDetailModel.h"
@interface AlgorithmFactoryDetailViewModel ()
@property (nonnull,nonatomic,strong) AlgorithmDetailViewModel *viewModel;
@property (nonnull,nonatomic,strong) AlgorithmSortDetailModel *model;
@end
@implementation AlgorithmFactoryDetailViewModel
#pragma mark ------ CreateAlgorithmModelsDelegate
- (AlgorithmViewModel *)createAlgorithmViewModelMethod{
    return self.viewModel;
}
- (AlgorithmModel *)createAlgorithmModelMethod;{
    return self.model;
}
- (void)didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    NSString *strSelector = [self.model showData][indexPath.row];
    SEL sel = NSSelectorFromString(strSelector);
    IMP imp = [self.viewModel methodForSelector:sel];
    imp();
}
#pragma mark ------ property
- (AlgorithmDetailViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[AlgorithmDetailViewModel alloc] init];
    }
    return _viewModel;
}
- (AlgorithmSortDetailModel *)model{
    if (!_model) {
        _model = [[AlgorithmSortDetailModel alloc] init];
    }
    return _model;
}
@end
