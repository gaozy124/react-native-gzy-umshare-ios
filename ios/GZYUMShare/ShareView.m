//
//  ShareView.m
//  UMShare
//
//  Created by aykj on 2016/12/21.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "ShareView.h"
#import "GZYVerticalButton.h"
#import <UMSocialCore/UMSocialCore.h>

@interface ShareView()

@property (unsafe_unretained, nonatomic) IBOutlet GZYVerticalButton *wechatBtn;
@property (unsafe_unretained, nonatomic) IBOutlet GZYVerticalButton *timeLineBtn;
@property (unsafe_unretained, nonatomic) IBOutlet GZYVerticalButton *weiboBtn;
@property (unsafe_unretained, nonatomic) IBOutlet GZYVerticalButton *qqBtn;
@property (unsafe_unretained, nonatomic) IBOutlet GZYVerticalButton *qZoneBtn;



@end


@implementation ShareView



+(instancetype)shareViewFromNib{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"GZYUMBundle" ofType:@"bundle"];
    ShareView *shareView = [[NSBundle bundleWithPath:path] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    [shareView.wechatBtn setImage:[UIImage imageNamed:@"GZYUMBundle.bundle/prize_icon_WeChat.tiff"] forState:UIControlStateNormal];
    [shareView.timeLineBtn setImage:[UIImage imageNamed:@"GZYUMBundle.bundle/prize_icon_WeChatpengyouquan.tiff"] forState:UIControlStateNormal];
    [shareView.weiboBtn setImage:[UIImage imageNamed:@"GZYUMBundle.bundle/prize_icon_weibo.tiff"] forState:UIControlStateNormal];
    [shareView.qqBtn setImage:[UIImage imageNamed:@"GZYUMBundle.bundle/prize_icon_qq.tiff"] forState:UIControlStateNormal];
    [shareView.qZoneBtn setImage:[UIImage imageNamed:@"GZYUMBundle.bundle/prize_icon_QQkongjian.tiff"] forState:UIControlStateNormal];
    
    return shareView;
}

- (IBAction)wechatShare:(GZYVerticalButton *)sender {
  [self shareMessageToPlatformType:UMSocialPlatformType_WechatSession];
}

- (IBAction)timeLineShare:(GZYVerticalButton *)sender {
  [self shareMessageToPlatformType:UMSocialPlatformType_WechatTimeLine];
}

- (IBAction)sinaShare:(GZYVerticalButton *)sender {
  [self shareMessageToPlatformType:UMSocialPlatformType_Sina];
}

- (IBAction)qqShare:(GZYVerticalButton *)sender {
  [self shareMessageToPlatformType:UMSocialPlatformType_QQ];
}

- (IBAction)aZoneShare:(GZYVerticalButton *)sender {
  [self shareMessageToPlatformType:UMSocialPlatformType_Qzone];
}

- (void)shareMessageToPlatformType:(UMSocialPlatformType)platformType
{
//  //创建分享消息对象
//  let messageObject = UMSocialMessageObject()
//  //设置文本
//  messageObject.text = share?.desc
//  
//  
//  //创建网页内容对象
//  let shareObject = UMShareWebpageObject.shareObject(withTitle: share?.title, descr: share?.desc, thumImage: UIImage(named: "加油少儿笑脸LOGO"))
//  
//  //设置网页地址
//  shareObject?.webpageUrl = self.url
//  
//  //分享消息对象设置分享内容对象
//  messageObject.shareObject = shareObject
//  //调用分享接口
//  UMSocialManager.default().share(to: platformType, messageObject: messageObject, currentViewController: self) {[weak self] (data, error) in
//    if error == nil{
//      SVProgressHUD.showSuccess(withStatus: "分享成功")
//      self?.superview?.removeFromSuperview()
//    }else{
//      print(error ?? "error为空")
//      self?.superview?.removeFromSuperview()
//    }
//  }
  //创建分享消息对象
  UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
  //设置文本
  messageObject.text = self.shareText;
  
  UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:self.title descr:self.shareText thumImage:[UIImage imageNamed:self.imageName]];
  shareObject.webpageUrl = self.webUrl;
  
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




@end
