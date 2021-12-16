//
//  AlgorithmListViewController.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/10.
//

#import "AlgorithmListViewController.h"
#import "AlgorithmFactoryListViewModel.h"
@interface AlgorithmListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView                        *tableView;
@property(nonatomic, strong) AlgorithmFactoryListViewModel *viewModel;
@property(nonatomic, strong) NSMutableArray                 *dataArray;
@end

@implementation AlgorithmListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}
- (void)setTableViewDataSource:(id)dataSource{
   NSArray *data = [self.viewModel setTableViewDataSoure:dataSource];
    [self.dataArray addObjectsFromArray:data];
    [self.tableView reloadData];
}
#pragma mark ------ delegate and dataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
   cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
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
- (AlgorithmFactoryListViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[AlgorithmFactoryListViewModel alloc] init];
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
