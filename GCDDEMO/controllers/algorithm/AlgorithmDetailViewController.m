//
//  AlgorithmDetailViewController.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "AlgorithmDetailViewController.h"
#import "AlgorithmFactoryDetailViewModel.h"
@interface AlgorithmDetailViewController ()
@property(nonatomic, strong) AlgorithmFactoryDetailViewModel *viewModel;
@property(nonatomic, strong) NSMutableArray                 *dataArray;
@end

@implementation AlgorithmDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
#pragma mark ------ set data
- (void)setTableViewDataSource:(id)dataSource{
    [self.viewModel didSelectRowAtIndexPath:dataSource];
}
#pragma mark ------ property
- (AlgorithmFactoryDetailViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[AlgorithmFactoryDetailViewModel alloc] init];
    }
    return _viewModel;
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
@end
