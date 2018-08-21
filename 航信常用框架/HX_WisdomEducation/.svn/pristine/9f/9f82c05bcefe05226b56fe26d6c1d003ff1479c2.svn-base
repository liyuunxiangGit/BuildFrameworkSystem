//
//  HXTablePlainController.m
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/4/18.
//

#import "HXTablePlainController.h"

@interface HXTablePlainController ()

@end

@implementation HXTablePlainController

- (void)loadView
{
    [super loadView];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.bottom.right.equalTo(self.view);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController setNavigationBarHidden:NO animated:TRUE];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:[UITableViewCell hx_className] forIndexPath:indexPath];
}

#pragma mark - lazy method
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
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
