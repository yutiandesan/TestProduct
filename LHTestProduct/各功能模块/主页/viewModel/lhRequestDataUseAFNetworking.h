//
//  lhRequestDataUseAFNetworking.h
//  LHTestProduct
//
//  Created by bosheng on 16/1/14.
//  Copyright © 2016年 liuhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface lhRequestDataUseAFNetworking : NSObject

/**检测网路状态**/
+ (void)checkNetworkStatus;

/**
 *JSON方式获取数据
 *urlStr:获取数据的url地址
 *
 */
+ (void)JSONDataWithUrl:(NSString *)url success:(void (^)(id json))success fail:(void (^)())fail;

/**
 *xml方式获取数据
 *urlStr:获取数据的url地址
 *
 */
+ (void)XMLDataWithUrl:(NSString *)urlStr success:(void (^)(id xml))success fail:(void (^)())fail;

/**
 *JSON方式post提交数据
 *urlStr:服务器地址
 *parameters:提交的内容参数
 *
 */
+ (void)postJSONWithUrl:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success;

/**
 *Session下载文件
 *urlStr :   下载文件的url地址
 *
 */
+ (void)sessionDownloadWithUrl:(NSString *)urlStr success:(void (^)(NSURL *fileURL))success fail:(void (^)())fail;

/**
 *文件上传,自己定义文件名
 *urlStr:    需要上传的服务器url
 *fileURL:   需要上传的本地文件URL
 *fileName:  文件在服务器上以什么名字保存
 *fileTye:   文件类型
 *
 */
+ (void)postUploadWithUrl:(NSString *)urlStr fileUrl:(NSURL *)fileURL fileName:(NSString *)fileName fileType:(NSString *)fileTye success:(void (^)(id responseObject))success fail:(void (^)())fail;

/**
 *文件上传,文件名由服务器端决定
 *urlStr:    需要上传的服务器url
 *fileURL:   需要上传的本地文件URL
 *
 */
+ (void)postUploadWithUrl:(NSString *)urlStr fileUrl:(NSURL *)fileURL success:(void (^)(id responseObject))success fail:(void (^)())fail;

/**
 * 解析json数据
 */
+ (NSDictionary *)dicWitJsonData:(id)response;

@end
