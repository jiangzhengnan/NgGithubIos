//
//  HomeController.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/5.
//

#import "HomeController.h"
#import "HomeDataLoader.h"
#import "RepoItemView.h"
#import "WebDetailView.h"
#import "RepoModel.h"

@interface HomeController () <UITableViewDataSource,
                              UITableViewDelegate,
                              RepoItemDelegate>
@property(nonatomic, strong, readwrite) HomeDataLoader *homeLoader;
//数据类
@property(nonatomic, strong) NSMutableArray *repoModelList;
//列表
@property(nonatomic, strong, readwrite) UITableView *tableView;

@end
@implementation HomeController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.homeLoader = [[HomeDataLoader alloc] init];

  self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  [self.view addSubview:self.tableView];

}

- (void)refreshView {
  NSLog(@"click?");
}

- (void)refreshData:(NSString *)token {
  NSLog(@"刷新仓库数据");
  __weak typeof(self) wself = self;
  [self.homeLoader loadUserRepos:token
                           block:^(BOOL success, NSMutableArray *model) {
                             __strong typeof(wself) strongSelf = wself;
                             strongSelf.repoModelList = model;
                             [strongSelf.tableView reloadData];
                           }];
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
    
    WebDetailView * detailWbView = [[WebDetailView alloc] initWithUrlString:item.html_url];
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
