//
//  lhLoginModel.h
//  LHTestProduct
//
//  Created by bosheng on 16/1/15.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lhUserModel.h"
#import "lhMainShowModel.h"

@interface lhLoginModel : NSObject

@property(nonatomic,strong)lhMainShowModel *noticeItem;
@property(nonatomic,copy)NSString *regist;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,strong)lhUserModel *user;
@property(nonatomic,copy)NSString *msg;

@end
