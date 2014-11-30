//
//  imageArray.m
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/28/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import "imageArray.h"

@implementation imageArray

@synthesize likedArray;
@synthesize myArray;
@synthesize imageStackArray;


+ (id)sharedManager {
    static imageArray *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        likedArray = [[NSMutableArray alloc] init];
        myArray = [[NSMutableArray alloc] init];
        imageStackArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end