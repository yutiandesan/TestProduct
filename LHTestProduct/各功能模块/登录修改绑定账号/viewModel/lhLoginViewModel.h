//
//  lhLoginViewModel.h
//  LHTestProduct
//
//  Created by bosheng on 16/1/15.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lhValidateCodeModel.h"

@interface lhLoginViewModel : NSObject

/**
 *  获取验证码
 */
+ (void)getValidate:(NSString *)phoneStr success:(void (^)(lhValidateCodeModel * user))success fail:(void (^)())fail;

/**
 *  电话号码验证
 */
+ (BOOL)validateMobile:(NSString *)mobile;

/**
 *  车牌号验证 MODIFIED BY HELENSONG
 */
+(BOOL) validateCarNo:(NSString *)carNo;

/**
 *  身份证号
 */
+ (BOOL)validateIdentityCard:(NSString *)identityCard;

@end
