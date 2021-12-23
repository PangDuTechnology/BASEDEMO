//
//  AlgorithmFactoryListViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/11.
//

#import "AlgorithmFactoryListViewModel.h"
#import "AlgorithmListViewModel.h"
#import "AlgorithmSortModel.h"
@interface AlgorithmFactoryListViewModel ()
@property(nonnull,nonatomic,strong) AlgorithmListViewModel *viewModel;
@property(nonnull,nonatomic,strong) AlgorithmModel *model;
@property(nonnull,nonatomic,copy) NSDictionary *modelDictionary;
@end
@implementation AlgorithmFactoryListViewModel
#pragma mark ------ CreateAlgorithmModelsDelegate
- (AlgorithmViewModel *)createAlgorithmViewModelMethod{
    return self.viewModel;
}
#pragma mark ------ AlgorithmModelsMethodDelegate
- (void)didSelectRowAtIndexPathArray:(NSArray*)array pushController:(UIViewController *)pushController{
    [self.viewModel didSelectRowAtIndexPathArray:array pushController:pushController];
}
- (NSArray *)setTableViewDataSoure:(id)indexPath{
    NSIndexPath *index = indexPath;
    NSString *strModel = self.modelDictionary[@(index.row)];
    Class class = NSClassFromString(strModel);
    self.model = [class new];
    NSArray *dataArray = [self.model showData];
    return dataArray;
}
#pragma mark ------ property
- (AlgorithmListViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[AlgorithmListViewModel alloc] init];
    }
    return _viewModel;
}
- (NSDictionary *)modelDictionary{
    if (!_modelDictionary) {
        _modelDictionary = @{
            @0  :   @"AlgorithThoughtModel",
            @1  :   @"AlgorithmSortModel",
            @2 :    @"AlgorithmSearchModel",
            @3 :    @"AlgorithmSubjectModel"
        };
    }
    return _modelDictionary;
}
@end
