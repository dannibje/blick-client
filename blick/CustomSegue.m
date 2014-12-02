//
//  CustomSegu.m
//  blick
//
//  Created by Daníel Björn Sigurbjörnsson on 12/1/14.
//  Copyright (c) 2014 danni. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue

-(void)perform {
    
    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    UIViewController *destinationController = (UIViewController*)[self destinationViewController];
    
    CATransition* transition = [CATransition animation];
    transition.duration = .25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    //transition.subtype = kCATransitionFromLeft; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    [sourceViewController.navigationController.view.layer addAnimation:transition
                                                                forKey:kCATransition];
    
    [sourceViewController.navigationController pushViewController:destinationController animated:NO];
    NSLog(@"navigation stack is: %@",[sourceViewController.navigationController viewControllers]);
    
}
    //- See more at: http://blog.jambura.com/2012/07/05/custom-segue-animation-left-to-right-using-catransition/#sthash.OJQ57oHx.dpuf

@end
