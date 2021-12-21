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
@property(nonatomic, copy) NSString                                  *strModel;
@end

@implementation AlgorithmListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}
- (void)setTableViewDataSource:(id)dataSource{
    NSIndexPath *indexPath = dataSource[0];
    self.strModel = dataSource[1];
   NSArray *data = [self.viewModel setTableViewDataSoure:indexPath];
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
    NSArray *array = @[@[indexPath,self.strModel]];
    [self.viewModel didSelectRowAtIndexPathArray:array pushController:self];
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
