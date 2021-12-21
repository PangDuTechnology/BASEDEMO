//
//  ListViewController.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/10/25.
//

#import "ListViewController.h"
#import "ListViewModel.h"
@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSArray                               *menuArray;
@property (nonatomic, strong)UITableView                        *tableView;
@property (nonatomic, strong) ListViewModel                    *viewModel;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
#pragma mark ------ user method
#pragma mark ------ delegate and dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.menuArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 200, 40)];
    [label setFont:[UIFont systemFontOfSize:20]];
    [label setTextAlignment:NSTextAlignmentLeft];
    label.text = self.menuArray[section];
    [view addSubview:label];
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.viewModel.unLockArray.count;
    }
    return  self.viewModel.commonArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (indexPath.section == 0) {
        cell.textLabel.text = self.viewModel.unLockArray[indexPath.row];
    }else{
        cell.textLabel.text = self.viewModel.commonArray[indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewModel didSelectRowAtIndexPath:indexPath];
}
#pragma mark ------ property
-  (NSArray *)menuArray{
    return @[ @"死锁",@"普通"];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
- (ListViewModel*)viewModel{
    if (!_viewModel) {
        _viewModel = [[ListViewModel alloc] init];
    }
    return _viewModel;
}
@end
