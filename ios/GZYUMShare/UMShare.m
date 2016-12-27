//
//  UMShare.m
//  UMShare
//
//  Created by aykj on 2016/12/26.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "UMShare.h"
#import <UMSocialCore/UMSocialCore.h>

@implementation UMShare

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setUmSocialAppkey:(NSString *)appKey){
  
  [[UMSocialManager defaultManager] setUmSocialAppkey:appKey];
  
}

RCT_EXPORT_METHOD(setPlaform:(UMSocialPlatformType)platform appKey:(NSString *)appKey appSecret:(NSString *)secret redirectURL:(NSString *)url){
  [[UMSocialManager defaultManager] setPlaform:platform appKey:appKey  appSecret:secret redirectURL:url];
}

RCT_EXPORT_METHOD(shareMessageToPlatformType:(UMSocialPlatformType)platformType title:(NSString *)title shareText:(NSString *)shareText imageName:(NSString *)imageName webUrl:(NSString *)url){
  //创建分享消息对象
  UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
  //设置文本
  messageObject.text = shareText;
  
  UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:shareText thumImage:[UIImage imageNamed:imageName]];
  shareObject.webpageUrl = url;
  
  messageObject.shareObject = shareObject;
  
  //调用分享接口
  [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
    if (error) {
      NSLog(@"************Share fail with error %@*********",error);
    }else{
      NSLog(@"response data is %@",data);
    }
  }];
}

- (NSDictionary *)constantsToExport
{
  return @{ @"UMSocialPlatformType_Sina" : @(UMSocialPlatformType_Sina),
            @"UMSocialPlatformType_WechatSession" : @(UMSocialPlatformType_WechatSession),
            @"UMSocialPlatformType_WechatTimeLine" : @(UMSocialPlatformType_WechatTimeLine),
            @"UMSocialPlatformType_QQ" : @(UMSocialPlatformType_QQ),@"UMSocialPlatformType_Qzone" : @(UMSocialPlatformType_Qzone)
            ,@"UMSocialPlatformType_UnKnown":@(UMSocialPlatformType_UnKnown)};
};


@end
