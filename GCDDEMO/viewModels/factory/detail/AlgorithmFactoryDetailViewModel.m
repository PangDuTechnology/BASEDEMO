//
//  AlgorithmFactoryDetailViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/14.
//

#import "AlgorithmFactoryDetailViewModel.h"
#import "AlgorithmDetailViewModel.h"
#import "AlgorithmDetailViewModel+AlgorithmThought.h"
#import "AlgorithmDetailViewModel+Algorithm.h"
#import "AlgorithmSortDetailModel.h"
@interface AlgorithmFactoryDetailViewModel ()
@property (nonnull,nonatomic,strong) AlgorithmDetailViewModel *viewModel;
@property (nonnull,nonatomic,strong) NSDictionary *modelDictionary;
@end
@implementation AlgorithmFactoryDetailViewModel
#pragma mark ------ CreateAlgorithmModelsDelegate
- (AlgorithmViewModel *)createAlgorithmViewModelMethod{
    return self.viewModel;
}
- (void)didSelectRowAtIndexPathArray:(NSArray *)array pushController:(nonnull UIViewController *)pushController{
    NSIndexPath *indexPath = array[0];
    NSString *strModel = array[1];
    AlgorithmModel *model =  [self didSelectAlgorithmModel:strModel];
    if (indexPath.row > [model showData].count - 1 ) {
        return;
    }
    NSString *strSelector = [model showData][indexPath.row];
    SEL sel = NSSelectorFromString(strSelector);
    if (!sel) {
        return;
    }
    IMP imp = [self.viewModel methodForSelector:sel];
    imp();
}
- (AlgorithmModel *)didSelectAlgorithmModel:(NSString*)strModel{
    NSString *strName = self.modelDictionary[strModel];
    Class class = NSClassFromString(strName);
    return [class new];
}
#pragma mark ------ property
- (AlgorithmDetailViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[AlgorithmDetailViewModel alloc] init];
    }
    return _viewModel;
}
- (NSDictionary *)modelDictionary{
    if (!_modelDictionary) {
        _modelDictionary = @{
            @"AlgorithThoughtModel":@"AlgorithmSortThoughtModel",
            
            @"AlgorithmSortModel": @"AlgorithmSortDetailModel"
        };
    }
    return _modelDictionary;
}
@end
