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

#define maxCountTime 60

@implementation lhLoginViewController
{
    lhLoginView * loginView;
    
    NSTimer * countTimer;
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
    
    __weak UIButton * vBtn = loginView.validateBtn;
    __weak typeof(self) weakSelf = self;
    [lhLoginViewModel getValidate:loginView.phoneTextField.text success:^(lhValidateCodeModel *user) {
        vBtn.userInteractionEnabled = NO;
        vBtn.backgroundColor = contentTitleColor;
        vBtn.tag = maxCountTime;
        vBtn.selected = YES;
        [vBtn setTitle:[NSString stringWithFormat:@"已发送(%ds)",maxCountTime] forState:UIControlStateSelected];
        
        if (!countTimer){
            countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:weakSelf selector:@selector(countTimerEvent) userInfo:nil repeats:YES];
        }

    }];
    
}

#pragma mark - 倒计时
- (void)countTimerEvent
{
    if (loginView.validateBtn.tag <= 1) {
        [countTimer invalidate];
        countTimer = nil;
        
        loginView.validateBtn.userInteractionEnabled = YES;
        loginView.validateBtn.selected = NO;
        [loginView.validateBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        loginView.validateBtn.backgroundColor = mainColor;
    }
    else{
        loginView.validateBtn.tag -= 1;
        [loginView.validateBtn setTitle:[NSString stringWithFormat:@"已发送(%lds)",(long)loginView.validateBtn.tag] forState:UIControlStateSelected];
    }
}

#pragma mark - 登录
- (void)loginBtnEvent
{
    NSLog(@"登录");
}

@end
