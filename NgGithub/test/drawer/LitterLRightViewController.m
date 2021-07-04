

#import "LitterLRightViewController.h"

#import "LitterLShowViewController.h"
#import "UIViewController+MMDrawerController.h"
@interface LitterLRightViewController ()

@end

@implementation LitterLRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Right-Demo";
}

#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text =[NSString stringWithFormat:@"Right-Demo%ld",indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    LitterLShowViewController *showVC = [[LitterLShowViewController alloc]init];
    showVC.title = [NSString stringWithFormat:@"Right-Demo%ld",indexPath.row];
    UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
    [nav pushViewController:showVC animated:NO];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
}
@end
