//
//  imageArray.h
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/28/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface imageArray : NSObject{
    NSMutableArray *likedArray;
    NSMutableArray *myArray;
    NSMutableArray *imageStackArray;
}

@property (nonatomic, retain) NSMutableArray *likedArray;
@property (nonatomic, retain) NSMutableArray *myArray;
@property (nonatomic, retain) NSMutableArray *imageStackArray;

+ (imageArray *)sharedManager;

@end
