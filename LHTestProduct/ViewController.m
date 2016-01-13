//
//  ViewController.m
//  LHTestProduct
//
//  Created by yutiandesan on 16-1-9.
//  Copyright (c) 2016年 liuhuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"支付失败，请重新支付！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
