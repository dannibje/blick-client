//
//  ViewController.h
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/25/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imageArray.h"

@interface ViewController : UIViewController
{
    imageArray *sharedManager;
}

//UI declerations
@property (weak, nonatomic) IBOutlet UINavigationItem *albumButton;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *declineButton;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;

-(void)updateImageUserData: (NSInteger)index;


@end

