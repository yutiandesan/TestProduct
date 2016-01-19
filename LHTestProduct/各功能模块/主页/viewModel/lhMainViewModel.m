//
//  lhMainViewModel.m
//  LHTestProduct
//
//  Created by bosheng on 16/1/15.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import "lhMainViewModel.h"
#import "lhRequestDataUseAFNetworking.h"


@implementation lhMainViewModel

+ (void)checkNetworkStatus
{
    [lhRequestDataUseAFNetworking checkNetworkStatus];
}

+ (void)autoLoginSuccess:(void (^)(lhLoginModel * user))success fail:(void (^)())fail
{
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",webUrl,@"/action/applogin_login"];
    NSDictionary * infoDict = [[NSBundle mainBundle]infoDictionary];
    NSString * nowVersion = [NSString stringWithFormat:@"ios-%@",[infoDict objectForKey:@"CFBundleShortVersionString"]];
    NSDictionary * parameters = @{@"mobile":@"15982160226",
                           @"mark":@"1",
                           @"token":@"apple_NO",
                           @"appVer":nowVersion};
    [lhRequestDataUseAFNetworking postJSONWithUrl:urlStr parameters:parameters success:^(id responseObject) {
        
        NSDictionary *dict = [lhRequestDataUseAFNetworking dicWitJsonData:responseObject];
        NSLog(@"%@",dict);
        lhLoginModel *model = [lhLoginModel mj_objectWithKeyValues:dict];

        NSLog(@"%@",model.user.id);
        if (success) {
            success(model);
        }
        
    } fail:^{
        if (fail) {
            fail();
        }
    }];
    
}

@end
