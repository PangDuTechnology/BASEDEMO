//
//  AlgorithmViewController.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/8.
//

#import "AlgorithmViewController.h"
#import "AlgorithmFactoryMenuViewModel.h"

@interface AlgorithmViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) AlgorithmFactoryMenuViewModel *viewModel;
@end

@implementation AlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}
#pragma mark ------ delegate and dataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  cell.textLabel.text = self.viewModel.tableViewDataSourceData[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.tableViewDataSourceData count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath pushController:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark ------ property
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
- (AlgorithmFactoryMenuViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[AlgorithmFactoryMenuViewModel alloc] init];
    }
    return _viewModel;
}
@end
