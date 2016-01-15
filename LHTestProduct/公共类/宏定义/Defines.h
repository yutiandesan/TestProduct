//
//  Defines.h
//  LHTestProduct
//
//  Created by bosheng on 16/1/14.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

//请求链接
#pragma mark - 正式
//#define webUrl @"http://api.up-oil.com"
//#define WXWebUrl @"http://wx.up-oil.com"
#pragma mark - 测试
#define webUrl @"http://123.57.233.24:81"
#define WXWebUrl @"http://wx.bs-innotech.com"

//tag值1000一下用于已知数目控件设置tag值，1000以上用于设置位置数目控件的tag值
#define backBtnTag 999
#define navigationBarTitleTag 998


//初始化图片
#define imageWithName(name) [UIImage imageNamed:name]

//字体
#define nowFontName @"ArialMT"

//size
#define DeviceMaxHeight ([UIScreen mainScreen].bounds.size.height)
#define DeviceMaxWidth ([UIScreen mainScreen].bounds.size.width)


//color
#define titleColor [UIColor colorFromHexRGB:@"ffffff"] //导航栏标题颜色
#define contentTitleColor [UIColor colorFromHexRGB:@"666666"] //正文颜色较深
#define contentTitleColor1 [UIColor colorFromHexRGB:@"999999"] //正文颜色稍浅
#define glineColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1] //线条颜色
#define tableDefSepLineColor [UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1] //表格线条颜色
#define lineColor [UIColor colorFromHexRGB:@"e77e23"] //按钮橙色
#define mainColor [UIColor colorFromHexRGB:@"3598dc"] //APP主色蓝色
#define viewColor [UIColor colorFromHexRGB:@"EBEBEB"] //背景色 浅灰色
#define buttonColor [UIColor colorFromHexRGB:@"aaaaaa"]

//请求后台固定签名串
#define OurRequestSignStr @"0581d9c5e04218f5bc5eed0bcde1cc89cc8d1798"


#endif /* Defines_h */
