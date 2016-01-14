//
//  lhNavigationBar.m
//  LHTestProduct
//
//  Created by bosheng on 16/1/14.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import "lhNavigationBar.h"

static UIViewController * tempVC;

@implementation lhNavigationBar

- (instancetype)initWithVC:(UIViewController *)tempVC title:(NSString *)titleStr isBackBtn:(BOOL)yesOrNo rightBtn:(NSString *)tStr
{
    self = [super initWithFrame:CGRectMake(0, 0, DeviceMaxWidth, 64)];
    if (self) {
        tempVC = tempVC;
        self.backgroundColor = mainColor;
        [self firmInitTitle:titleStr isBackBtn:yesOrNo rightBtn:tStr];
    }
    return self;
}

- (void)firmInitTitle:(NSString *)titleStr isBackBtn:(BOOL)yesOrNo rightBtn:(NSString *)tStr
{
    if (yesOrNo) {
        
        UIButton * backBg = [UIButton buttonWithType:UIButtonTypeCustom];
        backBg.frame = CGRectMake(2, 20, 70, 44);
        backBg.tag = backBtnTag;
        [backBg setBackgroundImage:imageWithName(@"back") forState:UIControlStateNormal];
        [self addSubview:backBg];
        [backBg addTarget:self action:@selector(backButtonEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UILabel * tLabel = [[UILabel alloc]init];
    tLabel.frame = CGRectMake(55, 20, DeviceMaxWidth-110, 44);
    tLabel.text = titleStr;
    tLabel.font = [UIFont fontWithName:nowFontName size:16];
    tLabel.font = [UIFont boldSystemFontOfSize:16];
    tLabel.textColor = [UIColor whiteColor];
    tLabel.tag = navigationBarTitleTag;
    tLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:tLabel];
    
    if (tStr && ![@"" isEqualToString:tStr]) {
        UIButton * saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [saveButton setTitle:tStr forState:UIControlStateNormal];
        [saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        saveButton.titleLabel.font = [UIFont fontWithName:nowFontName size:14];
        saveButton.titleLabel.font = [UIFont systemFontOfSize:14];
        saveButton.frame = CGRectMake(DeviceMaxWidth-62, 22, 60, 44);
        [saveButton addTarget:self action:@selector(saveButtonEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:saveButton];
    }
    
}

+ (void)mergeTitle:(NSString *)titleStr
{
    UILabel * tLabel = (UILabel *)[tempVC.view viewWithTag:1999];
    tLabel.text = titleStr;
}

- (void)backButtonEvent
{
    [tempVC.navigationController popViewControllerAnimated:YES];
}

- (void)saveButtonEvent
{
    if ([self.delegate respondsToSelector:@selector(rightBtnEvent)]) {
        [self.delegate rightBtnEvent];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
