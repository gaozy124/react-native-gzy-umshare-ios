//
//  GZYUMShareView.m
//  UMShare
//
//  Created by aykj on 2016/12/22.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "GZYUMShareView.h"
#import "ShareView.h"



@implementation GZYUMShareView

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(title,NSString)
RCT_EXPORT_VIEW_PROPERTY(shareText,NSString)
RCT_EXPORT_VIEW_PROPERTY(imageName,NSString)
RCT_EXPORT_VIEW_PROPERTY(webUrl,NSString)

-(UIView *)view{
  ShareView *shareView = [ShareView shareViewFromNib];
  return shareView;
}

//-(instancetype)initWithFrame:(CGRect)frame{
//  
//  if (self = [super initWithFrame:frame]) {
//    [self setupSubViews];
//  }
//  
//  return self;
//}
//
//
//-(void)setupSubViews{
//  
//  ShareView *shareView = [ShareView shareViewFromNib];
//  shareView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//  [self addSubview:shareView];
//
//}


@end
