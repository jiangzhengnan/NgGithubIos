//
//  FindController.m
//  NgGithub
//
// https://api.github.com/search/repositories?q=language:python&sort=stars’
//  Created by 小瓜瓜 on 2021/6/13.
//

#import "FindController.h"
#import "FindSearchLoader.h"
#import "RepoItemView.h"
#import "WebDetailView.h"
#import "RepoModel.h"
#import "Masonry.h"
#import "SearchView.h"

@interface FindController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong, readwrite) FindSearchLoader *searchLoader;
//数据类
@property(nonatomic, strong) NSMutableArray *repoModelList;
//列表
@property(nonatomic, strong, readwrite) UITableView *tableView;
//搜索view
@property(nonatomic, strong, readwrite) SearchView *searchView;

@property(nonatomic, strong) NSString *mToken;

@end

@implementation FindController

- (void)viewDidLoad {
  [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
  self.searchLoader = [[FindSearchLoader alloc] init];

  self.searchView = [[SearchView alloc] init];
    
    self.searchView.mSearchViewBlock = ^(NSString *text) {
           //weakSelf.textLabel.text = text;
        NSLog(@"需要去搜索2: %@", text);
        [self goToSearch:text];

       };
  [self.view addSubview:self.searchView];

  [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(@10);
    make.left.equalTo(@10);
    make.right.equalTo(@-10);
    make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width-20, 50));
  }];

  self.tableView = [[UITableView alloc] init];
  [self.view addSubview:self.tableView];
  [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.searchView.mas_bottom).with.offset(5);
    make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width,
                                     self.view.bounds.size.height - 65));
  }];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self goToSearch:@""];
}

- (void)goToSearch:(NSString *) key {
  NSLog(@"开始发起搜索");
    __weak typeof(self) wself = self;
    [self.searchLoader loadAllResp:self.mToken
                               key: key
                             block:^(BOOL success, NSMutableArray *model) {
                               __strong typeof(wself) strongSelf = wself;
                               strongSelf.repoModelList = model;
                               [strongSelf.tableView reloadData];
                             }];
}


- (void)refreshView {
  NSLog(@"click?");
}

- (void)refreshData:(NSString *)token {
  NSLog(@"刷新发现数据");
  self.mToken = token;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 130;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  //选中单个了
  RepoModel *item = [self.repoModelList objectAtIndex:indexPath.row];

  NSLog(@"点击了 %@", item.html_url);

  WebDetailView *detailWbView =
      [[WebDetailView alloc] initWithUrlString:item.html_url];
  [self.navigationController pushViewController:detailWbView animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return self.repoModelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  RepoItemView *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
  if (!cell) {
    cell = [[RepoItemView alloc] initWithStyle:UITableViewCellStyleSubtitle
                               reuseIdentifier:@"id"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
  }
  [cell layoutTableViewCellWithItem:[self.repoModelList
                                        objectAtIndex:indexPath.row]];
  return cell;
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell {
}

@end
