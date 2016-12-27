//
//  RCTConvert+UMEnum.m
//  UMShare
//
//  Created by aykj on 2016/12/26.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RCTConvert+UMEnum.h"
#import <UMSocialCore/UMSocialCore.h>

//typedef NS_ENUM(NSInteger,UMSocialPlatformType)
//{
//  UMSocialPlatformType_UnKnown            = -2,
//  //预定义的平台
//  UMSocialPlatformType_Predefine_Begin    = -1,
//  UMSocialPlatformType_Sina               = 0, //新浪
//  UMSocialPlatformType_WechatSession      = 1, //微信聊天
//  UMSocialPlatformType_WechatTimeLine     = 2,//微信朋友圈
//  UMSocialPlatformType_WechatFavorite     = 3,//微信收藏
//  UMSocialPlatformType_QQ                 = 4,//QQ聊天页面
//  UMSocialPlatformType_Qzone              = 5,//qq空间
//  UMSocialPlatformType_TencentWb          = 6,//腾讯微博
//  UMSocialPlatformType_AlipaySession      = 7,//支付宝聊天页面
//  UMSocialPlatformType_YixinSession       = 8,//易信聊天页面


@implementation RCTConvert (UMEnum)

RCT_ENUM_CONVERTER(UMSocialPlatformType, (@{ @"UMSocialPlatformType_Sina" : @(UMSocialPlatformType_Sina),
                                             @"UMSocialPlatformType_WechatSession" : @(UMSocialPlatformType_WechatSession),
                                             @"UMSocialPlatformType_WechatTimeLine" : @(UMSocialPlatformType_WechatTimeLine),
                                             @"UMSocialPlatformType_QQ" : @(UMSocialPlatformType_QQ),@"UMSocialPlatformType_Qzone" : @(UMSocialPlatformType_Qzone)
                                             ,@"UMSocialPlatformType_UnKnown":@(UMSocialPlatformType_UnKnown)}),
                   UMSocialPlatformType_UnKnown, integerValue)

@end
