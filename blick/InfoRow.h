//
//  infoRow.h
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/26/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoRow : NSObject
@property(nonatomic, readwrite) NSString *url;
@property(nonatomic, readwrite) NSString *name;
@property(nonatomic, readwrite) NSData *imageData;
@property(nonatomic, readwrite) NSData *userImage;
@end