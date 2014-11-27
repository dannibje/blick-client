//
//  AlbumViewController.h
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/25/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableArray *images, *imageLabels;
    NSMutableArray *yachtImages, *yachtImageLabels;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (strong, nonatomic) NSMutableArray *dataRows;
@property (strong, nonatomic) NSMutableArray *snowImageCells;
@property (strong, nonatomic) NSMutableArray *yachtImageCells;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
