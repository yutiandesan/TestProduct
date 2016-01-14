//
//  lhRequestDataUseAFNetworking.h
//  LHTestProduct
//
//  Created by bosheng on 16/1/14.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void requestSuccessBlock (void (^)(id json));

@interface lhRequestDataUseAFNetworking : NSObject

- (void)checkNetworkStatus;

+ (void)JSONDataWithUrl:(NSString *)url success:(requestSuccessBlock)success fail:(void (^)())fail;

@end
