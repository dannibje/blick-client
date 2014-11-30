//
//  AlbumViewController.h
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/25/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imageArray.h"
#import "RFQuiltLayout.h"

@interface AlbumViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, RFQuiltLayoutDelegate>
{
    NSMutableArray *images, *imageLabels;
    NSMutableArray *yachtImages, *yachtImageLabels;
    imageArray *sharedManager;
    NSMutableArray *sizeArray;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (strong, nonatomic) NSMutableArray *dataRows;

@property NSArray *animationArray;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
//@property (nonatomic, strong) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end
