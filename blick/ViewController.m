//
//  ViewController.m
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 11/25/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import "ViewController.h"
#import "ZLSwipeableView.h"
#import "CardView.h"
#import "infoRow.h"
#import "imageArray.h"

@interface ViewController ()<ZLSwipeableViewDataSource, ZLSwipeableViewDelegate>

@property (weak, nonatomic) IBOutlet ZLSwipeableView *swipeableView;

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic) NSUInteger stackControllindex;
@property (nonatomic) NSInteger currentIndex;

@end
    
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.stackControllindex = 0;
    self.currentIndex = 0;
    
    sharedManager = [[imageArray sharedManager] init];
    
    [self populateImageStack];
    [self populateAlbumArrays];
    [self updateImageUserData:self.currentIndex];
    
    //set up swipeable view
    [self.swipeableView setFrame:CGRectMake(8, 10, self.view.frame.size.width - 16, self.view.frame.size.height - 150)];
    
    [self.swipeableView setNeedsLayout];
    [self.swipeableView layoutIfNeeded];
    
    // required data source
    self.swipeableView.dataSource = self;
    
    // optional delegate
    self.swipeableView.delegate = self;
    
}

-(void)populateImageStack{
    
    //should not happen
    if(!sharedManager.imageStackArray){
        sharedManager.imageStackArray = [[NSMutableArray alloc] init];
    }
        
    for (int i = 0; i<6;i++) {
            
        InfoRow *obj = [[InfoRow alloc]init];
        
        obj.url = @"http://lygsbtd.files.wordpress.com/2011/08/beer_toast.jpg";
        obj.name = @"Daníel Björn Sigurbjörnsson";
        obj.imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://lygsbtd.files.wordpress.com/2011/08/beer_toast.jpg"]];
        obj.userImage= [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://vsmallfires.files.wordpress.com/2013/05/kappa.jpg"]];
        
        [sharedManager.imageStackArray addObject:obj];
        
        InfoRow *obj1 = [[InfoRow alloc]init];
        
        obj1.url = @"http://lygsbtd.files.wordpress.com/2011/08/beer_toast.jpg";
        obj1.name = @"Dan Bilz";
        obj1.imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://cdn.cnwimg.com/wp-content/uploads/2013/12/hotel-room.jpg"]];
        obj1.userImage= [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://emptylighthouse.com/sites/default/files/rW-d_6Y1_2.jpeg"]];
        
        [sharedManager.imageStackArray addObject:obj1];
    }
}

-(void)populateAlbumArrays{
    NSLog(@"SUCKAAAAAAA %lu",(unsigned long)sharedManager.likedArray.count);
    
    NSMutableArray *images = [[NSMutableArray alloc] initWithObjects:@"http://www.nhoutdoors.com/wp-content/uploads/2014/01/Snowboarder-Catching-Some-Air.jpg",@"http://best-snowboarding.com/wp-content/uploads/2013/01/snowboard.jpg",@"http://sunshineworld.co.uk/package_images/ski_poland_snowboard_poland_32.jpg",@"http://www.highcascade.com/map/img/picnicTable.jpg",@"http://farm4.static.flickr.com/3062/2401158515_7b7f5e016a_m.jpg",@"http://baileyduran.com/wp/wp-content/uploads/rail_slide_snowboard.jpeg", nil];
    
    NSMutableArray *yachtImages = [[NSMutableArray alloc] initWithObjects:@"snjekkja1.jpeg",@"snekkja2.jpeg",@"snekkja3.jpeg",@"snekkja4.jpeg",@"snekkja5.jpeg", nil];
    
    for (int i = 0; i<[images count]; i++) {
        InfoRow *cell = [[InfoRow alloc]init];
        cell.imageData =  [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [images objectAtIndex:i]]];
        
        [sharedManager.likedArray addObject:cell];
    }
    
    for (int j = 0; j<[yachtImages count]; j++) {
        InfoRow *cell = [[InfoRow alloc]init];
        cell.imageData =  [[NSData alloc]initWithContentsOfFile:[images objectAtIndex:j]];
        [sharedManager.myArray addObject:cell];
    }
    
    
    NSLog(@"SUCKAAAAAAA %lu",(unsigned long)sharedManager.likedArray.count);
}

-(void)updateImageUserData: (NSInteger)index
{
    InfoRow *obj = [[InfoRow alloc]init];
    obj = [sharedManager.imageStackArray objectAtIndex:index];
    
    self.userImage.image = [[UIImage alloc] initWithData:obj.userImage];
    self.userName.text = obj.name;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeLeftButtonAction:(UIButton *)sender {
    [self.swipeableView swipeTopViewToLeft];
}
- (IBAction)swipeRightButtonAction:(UIButton *)sender {
    [self.swipeableView swipeTopViewToRight];
}

//- (IBAction)reloadButtonAction:(UIButton *)sender {
//    self.index = 0;
//    [self.swipeableView discardAllSwipeableViews];
//    [self.swipeableView loadNextSwipeableViewsIfNeeded];
//}

#pragma mark - ZLSwipeableViewDelegate
- (void)swipeableView: (ZLSwipeableView *)swipeableView didSwipeLeft:(UIView *)view {
    NSLog(@"did swipe left");
    self.currentIndex++;
    [self updateImageUserData:self.currentIndex];
}
- (void)swipeableView: (ZLSwipeableView *)swipeableView didSwipeRight:(UIView *)view {
    NSLog(@"did swipe right");
    [sharedManager.likedArray addObject:[sharedManager.imageStackArray objectAtIndex:self.currentIndex]];
    self.currentIndex++;
    [self updateImageUserData:self.currentIndex];
    
}
- (void)swipeableView:(ZLSwipeableView *)swipeableView didStartSwipingView:(UIView *)view atLocation:(CGPoint)location {
    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}
- (void)swipeableView: (ZLSwipeableView *)swipeableView swipingView:(UIView *)view atLocation:(CGPoint)location  translation:(CGPoint)translation {
    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f", location.x, location.y, translation.x, translation.y);
}
- (void)swipeableView:(ZLSwipeableView *)swipeableView didEndSwipingView:(UIView *)view atLocation:(CGPoint)location {
    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
    
}

#pragma mark - ZLSwipeableViewDataSource
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {

    if(self.stackControllindex >= [sharedManager.imageStackArray count]-1){
        return nil;
    }
    
    CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
    view.cardData = [sharedManager.imageStackArray objectAtIndex:self.stackControllindex];
    
    NSLog(@"self.swipeableview is: %lu",(unsigned long)self.stackControllindex);
    
    [view show];
    self.stackControllindex++;
    return view;


}


@end
