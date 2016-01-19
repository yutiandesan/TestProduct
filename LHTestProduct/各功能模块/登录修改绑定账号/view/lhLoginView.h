//
//  lhLoginView.h
//  LHTestProduct
//
//  Created by bosheng on 16/1/15.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lhLoginView : UIView

/** 电话号码 */
@property (nonatomic,strong)UITextField * phoneTextField;
/** 电话号码输入线条 */
@property (nonatomic,strong)UIView * phoneLine;
/** 发送验证码按钮 */
@property (nonatomic,strong)UIButton * validateBtn;
/** 验证码输入 */
@property (nonatomic,strong)UITextField * codeTextField;
/** 验证码输入线条 */
@property (nonatomic,strong)UIView * validateLine;
/** 登录、确定按钮 */
@property (nonatomic,strong)UIButton * loginBtn;

- (instancetype)initWithFrame:(CGRect)frame withType:(NSInteger)type;

@end
