//
//  ShareView.h
//  UMShare
//
//  Created by aykj on 2016/12/21.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Share;
@interface ShareView : UIView

+(instancetype)shareViewFromNib;

@property(nonatomic,strong)Share *share;
@property (nonatomic, copy) NSString * title;//友盟appkey
@property (nonatomic, copy) NSString * shareText;//分享的文本
@property (nonatomic, copy) NSString * imageName;//分享的图片
@property (nonatomic, copy) NSString * webUrl;//分享按钮图片

@end
