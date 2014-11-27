//
//  CustomViewCell.h
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/25/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLMediaZoom.h"

@interface CustomViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) XLMediaZoom *imageZoomView;

- (void)imageDidTouch:(UIGestureRecognizer *)recognizer;

@end
