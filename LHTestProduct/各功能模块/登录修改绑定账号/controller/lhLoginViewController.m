//
//  lhLoginViewController.m
//  LHTestProduct
//
//  Created by bosheng on 16/1/15.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import "lhLoginViewController.h"
#import "lhLoginView.h"
#import "lhValidateCodeModel.h"
#import "lhLoginViewModel.h"

@implementation lhLoginViewController
{
    lhLoginView * loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    lhNavigationBar * nb = [[lhNavigationBar alloc]initWithVC:self title:self.type==5?@"修改绑定账号":@"登录" isBackBtn:YES rightBtn:nil];
//    nb.delegate = self;
    [self.view addSubview:nb];
    
    loginView = [[lhLoginView alloc]initWithFrame:CGRectMake(0, 64, DeviceMaxWidth, 200) withType:self.type];
    [self.view addSubview:loginView];
    [loginView.validateBtn addTarget:self action:@selector(validateBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [loginView.loginBtn addTarget:self action:@selector(loginBtnEvent) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [loginView.phoneTextField resignFirstResponder];
    [loginView.validateLine resignFirstResponder];
}

/**
 *  发送验证码
 */
- (void)validateBtnEvent
{
    if (loginView.validateBtn.selected) {
        return;
    }
    
    if ([@"" isEqualToString:loginView.phoneTextField.text]) {
        [lhNavigationBar showAlertWithMessage:@"请输入手机号码~" withSuperView:self.view withHeih:DeviceMaxHeight/2];
        return;
    }
    
    if (![lhLoginViewModel validateMobile:loginView.phoneTextField.text]) {
        [lhNavigationBar showAlertWithMessage:@"手机号码不合法~" withSuperView:self.view withHeih:DeviceMaxHeight/2];
        return;
    }
    
    loginView.validateBtn.selected = YES;
    NSLog(@"发送验证码");
    
    [lhLoginViewModel getValidate:loginView.phoneTextField.text success:^(lhValidateCodeModel *user) {
        
    } fail:^{
        
    }];
    
}

- (void)loginBtnEvent
{
    NSLog(@"登录");
}

@end
