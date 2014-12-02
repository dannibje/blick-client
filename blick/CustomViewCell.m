//
//  CustomViewCell.m
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/25/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import "CustomViewCell.h"

@implementation CustomViewCell

@synthesize imageZoomView   = _imageZoomView;

- (UIImageView *)imageView
{
    if (_image) return _image;
    return _image;
}

- (XLMediaZoom *)imageZoomView
{
    
    if (_imageZoomView) return _imageZoomView;
    if (_image.image == nil) return _imageZoomView;
    
    _imageZoomView = [[XLMediaZoom alloc] initWithAnimationTime:@(0.5) image:self.image blurEffect:YES];
    _imageZoomView.tag = 1;
    //_imageZoomView.backgroundColor = [UIColor colorWithRed:0.1 green:0.05 blue:0.15 alpha:1.0];
    
    return _imageZoomView;
}

- (void)imageDidTouch:(UIGestureRecognizer *)recognizer
{
    [self.superview.superview addSubview:self.imageZoomView];
    [self.imageZoomView show];
}

@end
