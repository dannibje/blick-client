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
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, self.frame.size.width-10, self.frame.size.height - 110)];
    
    //[contentView addSubview:image];
    [self addSubview:image];
    
    image.image = [UIImage imageWithData:_cardData.imageData];
    
}
@end