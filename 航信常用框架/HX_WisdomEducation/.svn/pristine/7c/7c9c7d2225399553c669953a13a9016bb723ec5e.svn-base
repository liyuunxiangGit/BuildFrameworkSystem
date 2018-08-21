//
//  HXTableGroupController.m
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/4/18.
//

#import "HXTableGroupController.h"

@interface HXTableGroupController ()

@end

@implementation HXTableGroupController

- (void)loadView
{
    [super loadView];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.bottom.right.equalTo(self.view);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColorMainGrayColor;
    [self configTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//父类配置cell，headerFooterView,做防错处理。
- (void)configTableView
{
    
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.tableFooterView = [UIView new];
    
    //默认系统cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[UITableViewCell hx_className]];
    //默认headerFooterView
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:[UITableViewHeaderFooterView hx_className]];
}

#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:[UITableViewHeaderFooterView hx_className] forIndexPath:indexPath];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}

#pragma mark - lazy method
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        if (@available(iOS 11.0, *))
        {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _tableView.delegate                             = self;
        _tableView.dataSource                           = self;
        _tableView.emptyDataSetSource                   = self;
        _tableView.emptyDataSetDelegate                 = self;
        _tableView.backgroundColor                      = UIColorMainGrayColor;
        _tableView.showsVerticalScrollIndicator         = NO;
        _tableView.showsHorizontalScrollIndicator       = NO;
        _tableView.separatorStyle                       = UITableViewCellSeparatorStyleNone;
        _tableView.separatorInset                       = UIEdgeInsetsZero;
        
    }
    return _tableView;
}

@end
