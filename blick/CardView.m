//
//  cardView.m
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/26/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import "CardView.h"

@implementation CardView
-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        if (self) {
            self.backgroundColor = [UIColor whiteColor];
            
            //// Color Declarations
            UIColor* shadowColor2 = [UIColor colorWithRed: 0.209 green: 0.209 blue: 0.209 alpha: 1];
            
            //// Shadow Declarations
            UIColor* shadow = [shadowColor2 colorWithAlphaComponent: 0.73];
            CGSize shadowOffset = CGSizeMake(3.1/2.0, -0.1/2.0);
            CGFloat shadowBlurRadius = 12/2.0;
            self.layer.shadowColor = [shadow CGColor];
            self.layer.shadowOpacity = 0.73;
            self.layer.shadowOffset = shadowOffset;
            self.layer.shadowRadius = shadowBlurRadius;
            self.layer.shouldRasterize = YES;
        }
    }
    return self;
}

-(void)show{
    
//    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//    contentView.backgroundColor = [UIColor whiteColor];
    
  //  NSLog(@"size of card is: %f %f", contentView.frame.size.width, contentView.frame.size.height);
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    //[contentView addSubview:image];
    [self addSubview:imageView];
    imageView.image = nil;
    
    #define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    dispatch_async(kBgQueue, ^{
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_cardData.imageData]];
        if (imgData) {
            UIImage *image = [UIImage imageWithData:imgData];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_cardData.imageData]]];
                });
            }
        }
    });
    //image.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_cardData.imageData]]];
    
}
@end