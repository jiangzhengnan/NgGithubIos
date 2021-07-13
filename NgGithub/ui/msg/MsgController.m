//
//  MsgController.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/13.
//

#import "MsgController.h"
#import "MsgDataLoader.h"
#import "MsgItemView.h"

@interface MsgController () <UITableViewDataSource, UITableViewDelegate>{
    
}

@property(nonatomic, strong, readwrite) MsgDataLoader *msgLoader;
//数据类
@property(nonatomic, strong) NSMutableArray *repoModelList;
//列表
@property(nonatomic, strong, readwrite) UITableView *tableView;

@property(nonatomic, strong) NSString * mToken;

@end

@implementation MsgController

- (void)viewDidLoad {
  [super viewDidLoad];
    NSLog(@"刷新MsgviewDidLoad");
  self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  [self.view addSubview:self.tableView];
    
    self.msgLoader = [[MsgDataLoader alloc] init];
  __weak typeof(self) wself = self;
    [self.msgLoader loadMsgData:self.mToken block:^(BOOL success, NSMutableArray *model) {
        __strong typeof(wself) strongSelf = wself;
        
        //        strongSelf.repoModelList = model;
//        [strongSelf.tableView reloadData];
    }];
}
 

- (void)refreshData:(NSString *)token {
    self.mToken = token;
  NSLog(@"刷新Msg数据  %@",self.mToken);
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 130;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  //选中单个了
  //    RepoModel *item = [self.repoModelList objectAtIndex:indexPath.row];
  //
  //   NSLog(@"点击了 %@", item.html_url);
  //
  //    WebDetailView * detailWbView = [[WebDetailView alloc]
  //    initWithUrlString:item.html_url]; [self.navigationController
  //    pushViewController:detailWbView animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return self.repoModelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MsgItemView *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
  if (!cell) {
    cell = [[MsgItemView alloc] initWithStyle:UITableViewCellStyleSubtitle
                              reuseIdentifier:@"id"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  }
  [cell layoutTableViewCellWithItem:[self.repoModelList
                                        objectAtIndex:indexPath.row]];
  return cell;
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell {
}

@end
