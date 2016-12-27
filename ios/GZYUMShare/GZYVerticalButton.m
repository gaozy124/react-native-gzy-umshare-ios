//
//  GZYVerticalButton.m
//  UMShare
//
//  Created by aykj on 2016/12/21.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "GZYVerticalButton.h"

@implementation GZYVerticalButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat minF = MIN(self.frame.size.height, self.frame.size.width);
    CGSizeMake(minF * 0.5, minF * 0.5);
    CGFloat width = minF * 0.5;
    CGFloat height = width;
    CGFloat x = (self.frame.size.width - width) * 0.5;
    CGFloat y = (self.frame.size.height - height) * 0.3;
    
    self.imageView.frame = CGRectMake(x, y, width, height);
    
    //        titleLabel?.sizeToFit()
    CGRect frame = self.titleLabel.frame;
    frame.origin.x = 0;
    frame.origin.y = CGRectGetMaxY(self.imageView.frame) + 5;
    frame.size.width = self.frame.size.width;
    self.titleLabel.frame = frame;
}

@end
