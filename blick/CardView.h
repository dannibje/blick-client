//
//  cardView.h
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/26/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLSwipeableView.h"
#import "InfoRow.h"


@interface CardView : UIView
@property InfoRow *cardData;
-(void)show;
@end