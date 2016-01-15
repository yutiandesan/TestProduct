//
//  lhLoginViewController.m
//  LHTestProduct
//
//  Created by bosheng on 16/1/15.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import "lhLoginViewController.h"

@implementation lhLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    lhNavigationBar * nb = [[lhNavigationBar alloc]initWithVC:self title:@"登录" isBackBtn:YES rightBtn:nil];
//    nb.delegate = self;
    [self.view addSubview:nb];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
