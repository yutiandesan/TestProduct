//
//  lhNavigationBar.h
//  LHTestProduct
//
//  Created by bosheng on 16/1/14.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol rightBtnDelegate <NSObject>

- (void)rightBtnEvent;//导航栏右按钮事件

@end

@interface lhNavigationBar : UIView
{
    UIViewController * tempVC;
}

@property (nonatomic,assign)id<rightBtnDelegate> delegate;

- (instancetype)initWithVC:(UIViewController *)tempVC title:(NSString *)titleStr isBackBtn:(BOOL)yesOrNo rightBtn:(NSString *)tStr;

/**
 *  显示一个提示
 */
+ (void)showAlertWithMessage:(NSString *)message withSuperView:(UIView *)superView withHeih:(CGFloat)heih;

@end
