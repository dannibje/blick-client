//
//  AlbumViewController.m
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/25/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import "AlbumViewController.h"
#import "CustomViewCell.h"

@interface InfoRow2 : NSObject
@property(nonatomic, readwrite) NSString *image;
@property(nonatomic, readwrite) NSString *description;
@end

@implementation InfoRow2
@synthesize image;
@synthesize description;

-(id)init
{
    self = [super init];
    return self;
}
@end

@interface AlbumViewController ()

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    images = [[NSMutableArray alloc] initWithObjects:@"snow1.jpeg",@"snow2.jpeg",@"snow3.jpeg",@"snow4.jpeg",@"snow5.jpeg",@"snow6.jpeg", nil];
    imageLabels = [[NSMutableArray alloc] initWithObjects:@"mynd1",@"mynd2",@"mynd3",@"mynd4",@"mynd5",@"mynd6", nil];
    
    yachtImages = [[NSMutableArray alloc] initWithObjects:@"snekkja1.jpeg",@"snekkja2.jpeg",@"snekkja3.jpeg",@"snekkja4.jpeg",@"snekkja5.jpeg", nil];
    yachtImageLabels = [[NSMutableArray alloc] initWithObjects:@"snekkja1",@"snekkja2",@"snekkja3",@"snekkja5",@"snekkja5",@"snekkja6", nil];
    
    self.snowImageCells = [NSMutableArray array];
    self.yachtImageCells = [NSMutableArray array];
    self.dataRows = [NSMutableArray array];
    
    for (int i = 0; i<[images count]; i++) {
        InfoRow2 *cell = [[InfoRow2 alloc]init];
        cell.image = [images objectAtIndex:i];
        cell.description = [imageLabels objectAtIndex:i];
        [self.snowImageCells addObject:cell];
    }
    
    for (int j = 0; j<[yachtImages count]; j++) {
        InfoRow2 *cell = [[InfoRow2 alloc]init];
        cell.image = [yachtImages objectAtIndex:j];
        cell.description = [yachtImageLabels objectAtIndex:j];
        [self.yachtImageCells addObject:cell];
    }
    
    self.dataRows = self.snowImageCells;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)segmentChanged:(id)sender {
    switch (self.segmentedControl.selectedSegmentIndex)
    {
        case 0:
            NSLog(@"first segment selected");
            self.dataRows = self.snowImageCells;
            [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
            break;
        case 1:
            NSLog(@"second segment selected");
            self.dataRows = self.yachtImageCells;
            [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
            break;
        default:
            break;
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataRows count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomViewCell *myCell = (CustomViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    InfoRow2 *cell = [self.dataRows objectAtIndex:indexPath.row];
    
    myCell.image.image = [UIImage imageNamed:cell.image];
    myCell.label.text = cell.description;
    
    
    //error
    [myCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:myCell action:@selector(imageDidTouch:)]];
    [myCell setUserInteractionEnabled:YES];
    
    return myCell;
}

//- (BOOL)collectionView:(UICollectionView *)collectionView
//shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}
//
//
//-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"clicked:%@",indexPath);
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
