//
//  lhMainViewController.m
//  LHTestProduct
//
//  Created by bosheng on 16/1/14.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import "lhMainViewController.h"
#import "lhRequestDataUseAFNetworking.h"

@interface lhMainViewController ()<rightBtnDelegate>

@end

@implementation lhMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    lhNavigationBar * nb = [[lhNavigationBar alloc]initWithVC:self title:@"首页" isBackBtn:NO rightBtn:@"下一页"];
    nb.delegate = self;
    [self.view addSubview:nb];
    
    
    [[lhRequestDataUseAFNetworking alloc]checkNetworkStatus];
    
//    lhRequestDataUseAFNetworking JSONDataWithUrl:<#(NSString *)#> success:<#^(id json)success#> fail:<#^(void)fail#>
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rightBtnEvent
{
    NSLog(@"下一页");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
