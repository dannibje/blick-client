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

@interface ViewController ()<ZLSwipeableViewDataSource, ZLSwipeableViewDelegate>
@property (weak, nonatomic) IBOutlet ZLSwipeableView *swipeableView;

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic) NSUInteger index;
@property InfoRow *obj;

@end
    
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self populateImageStack];
    self.index = 0;
    
    [self.swipeableView setFrame:CGRectMake(8, 10, self.view.frame.size.width - 16, self.view.frame.size.height - 150)];
    
    NSLog(@"size of swipeableview is: %f",self.swipeableView.frame.size.width);
    NSLog(@"size of self.view is: %f %f",self.view.frame.size.width, self.view.frame.size.height);
    
    NSLog(@"size of swipeableview x og y is: %f %f",self.swipeableView.frame.origin.x,self.swipeableView.frame.origin.y);
    
    [self.swipeableView setNeedsLayout];
    [self.swipeableView layoutIfNeeded];
    
    // required data source
    self.swipeableView.dataSource = self;
    
    // optional delegate
    self.swipeableView.delegate = self;
    
}

-(void)populateImageStack{
    
    if(!self.data){
        self.data = [[NSMutableArray alloc] init];
    }
        
    for (int i = 0; i<6;i++) {
            
        InfoRow *obj = [[InfoRow alloc]init];
        
        obj.url = @"http://lygsbtd.files.wordpress.com/2011/08/beer_toast.jpg";
        obj.name = @"Danni bjé";
        obj.imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://lygsbtd.files.wordpress.com/2011/08/beer_toast.jpg"]];
        
        [self.data addObject:obj];
    }
    
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
- (IBAction)reloadButtonAction:(UIButton *)sender {
    self.index = 0;
    [self.swipeableView discardAllSwipeableViews];
    [self.swipeableView loadNextSwipeableViewsIfNeeded];
}

#pragma mark - ZLSwipeableViewDelegate
- (void)swipeableView: (ZLSwipeableView *)swipeableView didSwipeLeft:(UIView *)view {
    NSLog(@"did swipe left");
}
- (void)swipeableView: (ZLSwipeableView *)swipeableView didSwipeRight:(UIView *)view {
    NSLog(@"did swipe right");
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

    if(self.index >= 6){
        return nil;
    }
    CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
    view.cardData = [self.data objectAtIndex:self.index];
    
    NSLog(@"self.swipeableview is: %f %f",self.swipeableView.frame.size.width, self.swipeableView.frame.size.height);
    
    [view show];
    self.index++;
    return view;


}


@end
