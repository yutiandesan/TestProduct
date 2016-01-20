//
//  lhMainViewModel.h
//  LHTestProduct
//
//  Created by bosheng on 16/1/15.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lhLoginModel.h"

@interface lhMainViewModel : NSObject

/**检测网路状态**/
+ (void)checkNetworkStatus;

/**
 *  登录并获取数据
 */
+ (void)autoLoginSuccess:(void (^)(lhLoginModel * user))success;


@end
