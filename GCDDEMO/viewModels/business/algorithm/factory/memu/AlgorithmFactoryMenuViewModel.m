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
@property(nonnull,nonatomic,copy) NSDictionary *menuDictionary;
@end

@implementation AlgorithmFactoryMenuViewModel
#pragma mark ------ CreateAlgorithmModelsDelegate
- (AlgorithmViewModel *)createAlgorithmViewModelMethod{
    return self.viewModel;
}
#pragma mark ------ AlgorithmModelsMethodDelegate.h
- (void)didSelectRowAtIndexPathArray:(NSArray*)array pushController:(UIViewController *)pushController{
    NSIndexPath *indexPath = array[0];
    NSString *strMenu = self.menuDictionary[@(indexPath.row)];
    NSArray *dataArray = @[@[indexPath,strMenu]];
    [self.viewModel didSelectRowAtIndexPathArray:dataArray pushController:pushController];
}
- (NSArray *)tableViewDataSourceData{
    return [self.model returnModelArray];
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
- (NSDictionary *)menuDictionary{
    if (!_menuDictionary) {
        _menuDictionary = @{
            @0  :    @"AlgorithThoughtModel",
            @1  :    @"AlgorithmSortModel",
            @2  :    @"AlgorithmSearchModel",
            @3  :    @"AlgorithmSubjectMenuModel"
        };
    }
    return _menuDictionary;
}
@end
