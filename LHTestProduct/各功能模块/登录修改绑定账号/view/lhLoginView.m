//
//  lhLoginView.m
//  LHTestProduct
//
//  Created by bosheng on 16/1/15.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import "lhLoginView.h"

@implementation lhLoginView

- (instancetype)initWithFrame:(CGRect)frame withType:(NSInteger)type
{
    self = [super initWithFrame:frame];
    if (self) {
        [self firmInit:type];
    }
    
    return self;
}

- (void)firmInit:(NSInteger)type
{
    self.phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(15, 30, DeviceMaxWidth-30, 40)];
    self.phoneTextField.textColor = contentTitleColor;
    self.phoneTextField.font = [UIFont fontWithName:nowFontName size:14];
    self.phoneTextField.placeholder = @"11位手机号码";
    self.phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:self.phoneTextField];
    
    self.phoneLine = [[UIView alloc]initWithFrame:CGRectMake(10, 70, DeviceMaxWidth-20, 0.5)];
    self.phoneLine.backgroundColor = tableDefSepLineColor;
    [self addSubview:self.phoneLine];
    
    self.codeTextField = [[UITextField alloc]initWithFrame:CGRectMake(15, 70, DeviceMaxWidth-90, 40)];
    self.codeTextField.textColor = contentTitleColor;
    self.codeTextField.font = [UIFont fontWithName:nowFontName size:14];
    self.codeTextField.placeholder = @"验证码";
    self.codeTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:self.codeTextField];
    
    self.validateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.validateBtn.frame = CGRectMake(DeviceMaxWidth-95, 75, 85, 30);
    [self.validateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.validateBtn.backgroundColor = mainColor;
    self.validateBtn.layer.cornerRadius = 4;
    self.validateBtn.layer.masksToBounds = YES;
    [self.validateBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.validateBtn.titleLabel.font = [UIFont fontWithName:nowFontName size:14];
    [self.validateBtn setTitle:@"已发送(60s)" forState:UIControlStateSelected];
    [self.validateBtn setTitleColor:viewColor forState:UIControlStateSelected];
    [self addSubview:self.validateBtn];
    
    self.validateLine = [[UIView alloc]initWithFrame:CGRectMake(10, 110, DeviceMaxWidth-20, 0.5)];
    self.validateLine.backgroundColor = tableDefSepLineColor;
    [self addSubview:self.validateLine];
    
    CGFloat heih = 120;
    if (type != 5){//修改绑定账号
        heih += 30;
    }
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.frame = CGRectMake(10, heih, DeviceMaxWidth-20, 40);
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = mainColor;
    self.loginBtn.layer.cornerRadius = 4;
    self.loginBtn.layer.masksToBounds = YES;
    [self.loginBtn setTitle:type==5?@"确定":@"登录" forState:UIControlStateNormal];
    self.loginBtn.titleLabel.font = [UIFont fontWithName:nowFontName size:14];
    [self addSubview:self.loginBtn];
}

@end
