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
#import "AlgorithmDetailViewModel+Search.h"
#import "AlgorithmSortDetailModel.h"
@interface AlgorithmFactoryDetailViewModel ()
@property (nonnull,nonatomic,strong) AlgorithmDetailViewModel *viewModel;
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
    if (indexPath.row > [model returnModelArray].count - 1 ) {
        return;
    }
    NSString *strSelector = [model returnModelArray][indexPath.row];
    SEL sel = NSSelectorFromString(strSelector);
    if (!sel) {
        return;
    }
    IMP imp = [self.viewModel methodForSelector:sel];
    imp();
}
- (id)getModelDictionary{
    Class class = NSClassFromString(@"AlgorithmFactoryDetailModel");
    id  value = [class new];
    SEL sel = NSSelectorFromString(@"returnModelDicionary");
    if ([value respondsToSelector:sel]) {
        IMP imp = [value methodForSelector:sel];
        NSDictionary*(*funaction)(id,SEL) = (void *)imp;
        return funaction(value,sel);
    }
    return NULL;
}
- (AlgorithmModel *)didSelectAlgorithmModel:(NSString*)strModel{
    NSDictionary *dictionary =  [self getModelDictionary];
     if (dictionary == NULL) {
         return nil;
     }
    NSString *strName = dictionary[strModel];
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
@end
