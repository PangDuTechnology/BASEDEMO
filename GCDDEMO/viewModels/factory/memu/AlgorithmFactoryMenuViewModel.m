//
//  AlgorithmFactoryMenuViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "AlgorithmFactoryMenuViewModel.h"
#import "AlgorithmMenuViewModel.h"
#import "AlgorithmMenuModel.h"

@interface AlgorithmFactoryMenuViewModel ()
@property(nonnull, nonatomic,strong) AlgorithmMenuViewModel *viewModel;
@property(nonnull,nonatomic,strong) AlgorithmMenuModel *model;
@property(nonnull,nonatomic,copy) NSDictionary *modelDictionary;
@property(nonnull,nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation AlgorithmFactoryMenuViewModel
#pragma mark ------ CreateAlgorithmModelsDelegate
- (AlgorithmViewModel *)createAlgorithmViewModelMethod{
    return self.viewModel;
}
- (AlgorithmModel *)createAlgorithmModelMethod{
    return self.model;
}
#pragma mark ------ AlgorithmModelsMethodDelegate.h
- (void)didSelectRowAtIndexPath:(NSIndexPath*)indexPath pushController:(UIViewController *)pushController{
    [self.viewModel didSelectRowAtIndexPath:indexPath pushController: pushController];
}
- (NSArray *)tableViewDataSourceData{
    return [self.model showData];
}
#pragma mark ------ property
- (AlgorithmMenuViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[AlgorithmMenuViewModel alloc] init];
    }
    return _viewModel;
}
- (AlgorithmMenuModel *)model{
    if (!_model) {
        _model = [[AlgorithmMenuModel alloc] init];
    }
    return _model;
}
@end
