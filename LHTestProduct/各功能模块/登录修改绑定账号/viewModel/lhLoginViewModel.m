//
//  lhLoginViewModel.m
//  LHTestProduct
//
//  Created by bosheng on 16/1/15.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import "lhLoginViewModel.h"

@implementation lhLoginViewModel

+ (void)getValidate:(NSString *)phoneStr success:(void (^)(lhValidateCodeModel * user))success
{
    
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",webUrl,@"/action/verification_genVerCode"];
    NSDictionary * parameters = @{@"mobile":phoneStr,
                                  @"regType":@"100"};
    [lhRequestDataUseAFNetworking postJSONWithUrl:urlStr parameters:parameters success:^(id responseObject) {
        
        NSDictionary *dict = [lhRequestDataUseAFNetworking dicWitJsonData:responseObject];
        lhValidateCodeModel *model = [lhValidateCodeModel mj_objectWithKeyValues:dict];
        
        if (success) {
            success(model);
        }
        
    }];
}

#pragma mark - 手机号验证
/*手机号码验证 MODIFIED BY HELENSONG*/
+ (BOOL)validateMobile:(NSString *)mobile
{
    if (mobile && mobile.length == 11 && [mobile characterAtIndex:0] == '1') {
        return YES;
    }
    
    return NO;
}

/*车牌号验证 MODIFIED BY HELENSONG*/
+ (BOOL)validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    
    return [carTest evaluateWithObject:carNo];
}

//身份证号
+ (BOOL)validateIdentityCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

@end
