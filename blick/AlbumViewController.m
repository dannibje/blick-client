//
//  AlbumViewController.m
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/25/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import "AlbumViewController.h"
#import "CustomViewCell.h"
#import "XHImageViewer.h"
#import "imageArray.h"
#import "infoRow.h"
#import "CustomUnwindSegue.h"

@interface AlbumViewController ()<XHImageViewerDelegate>

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"menu" style:UIBarButtonItemStylePlain target:self action:@selector(unwindToMenu)];
    
//    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    [self.collectionView setCollectionViewLayout:self.flowLayout];
    
    RFQuiltLayout* layout = (id)[self.collectionView collectionViewLayout];
    layout.direction = UICollectionViewScrollDirectionVertical;
    layout.blockPixels = CGSizeMake(100,100);
    
    sizeArray = [[NSMutableArray alloc] init];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"big"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"big"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"samll"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"small"];
    [sizeArray addObject:@"big"];
    
    sharedManager = [imageArray sharedManager];
    
    self.dataRows = sharedManager.likedArray;
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)unwindToMenu
{
    [self performSegueWithIdentifier:@"unwindFromViewController" sender:self];
}

- (IBAction)segmentChanged:(id)sender {
    switch (self.segmentedControl.selectedSegmentIndex)
    {
        case 0:
            NSLog(@"first segment selected");
            self.dataRows = sharedManager.likedArray;
            [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
            break;
        case 1:
            NSLog(@"second segment selected");
            self.dataRows = sharedManager.myArray;
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
    CustomViewCell *myCell;
    int controller = 1;
    
    if([[sizeArray objectAtIndex:indexPath.item]  isEqual: @"big"]){
        myCell = (CustomViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"customCellBig" forIndexPath:indexPath];
    }else{
        myCell = (CustomViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    }
    controller++;
    
    InfoRow *cell = [self.dataRows objectAtIndex:indexPath.row];
    myCell.image.image = [UIImage imageWithData:cell.imageData];;
    
    //error
    [myCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:myCell action:@selector(imageDidTouch:)]];
    [myCell setUserInteractionEnabled:YES];
    
    return myCell;
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout blockSizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row >= sharedManager.likedArray.count) {
        NSLog(@"Asking for index paths of non-existant cells!! %ld from %lu cells", (long)indexPath.row, (unsigned long)sharedManager.likedArray.count);
    }
    
    CGFloat width;
    CGFloat height;

    if([[sizeArray objectAtIndex:indexPath.item]  isEqual: @"big"]){
        width = 2;
        height = 2;
    }else{
        width = 1;
        height = 1;
    }

    return CGSizeMake(width, height);
    
    //    if (indexPath.row % 10 == 0)
    //        return CGSizeMake(3, 1);
    //    if (indexPath.row % 11 == 0)
    //        return CGSizeMake(2, 1);
    //    else if (indexPath.row % 7 == 0)
    //        return CGSizeMake(1, 3);
    //    else if (indexPath.row % 8 == 0)
    //        return CGSizeMake(1, 2);
    //    else if(indexPath.row % 11 == 0)
    //        return CGSizeMake(2, 2);
    //    if (indexPath.row == 0) return CGSizeMake(5, 5);
    //
    //    return CGSizeMake(1, 1);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetsForItemAtIndexPath:(NSIndexPath *)indexPath {
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"clicked:%@",indexPath);
//    
//    XHImageViewer *imageViewer = [[XHImageViewer alloc] init];
//    imageViewer.delegate = self;
//    [imageViewer showWithImageViews:_animationArray selectedView:_animationArray[indexPath.item]];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
