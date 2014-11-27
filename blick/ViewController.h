//
//  ViewController.h
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/25/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *albumButton;

@property (strong,nonatomic) NSMutableArray * data;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

