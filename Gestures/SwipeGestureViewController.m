//
//  SwipeGestureViewController.m
//  Gestures
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "SwipeGestureViewController.h"

@interface SwipeGestureViewController ()

@property (nonatomic) BOOL topViewIsOpen;

@end

@implementation SwipeGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topViewIsOpen = NO;
   //DONE //two separate gestures, 1 for left 1 for right, check for sender.direction
//DONE //create two rectangles, white and a brown, add the brown as a subview of the main view, white on is a subview of the brown view and sits on top.
 //DONE   //bool property to see which is open, clip the bounds of the brown view so it's subview doesn't 'slide out'
  // on left swipe //in the gesture recognizer you will move the origin of the white view along the x axis only in line with the swipe (up to a max of say 150 points) -if statement)
//on right swipe do the opposite up to the y value of the superview ?
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds)-self.view.bounds.size.width/2+15, CGRectGetMidY(self.view.bounds)-50/2, self.view.bounds.size.width-30, 50)];
    bottomView.backgroundColor = [UIColor brownColor];
    bottomView.clipsToBounds = YES;
    [self.view addSubview:bottomView];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, bottomView.frame.size.width, bottomView.frame.size.height)];
    
    topView.backgroundColor = [UIColor whiteColor];
    topView.userInteractionEnabled = YES;
    
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGesture:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGesture:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [topView addGestureRecognizer:leftSwipe];
    [topView addGestureRecognizer:rightSwipe];
    
     [bottomView addSubview:topView];
    [bottomView bringSubviewToFront:topView];


}

- (IBAction)swipeGesture:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipe gesture reporting for duty, hah you said duty");
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft){
//        CGPoint touchLocation = [sender locationInView:self.view];
        //learned that you cant direction change the origin.x value, you can do it in steps and then reassign.
        //sender.view.frame.origin.x = not assignable
        //made below instant code and then added animation instead
//        CGRect newFrameX = sender.view.frame;
//        newFrameX.origin.x = sender.view.frame.origin.x - 100;
//        sender.view.frame = newFrameX;
        [UIView animateWithDuration:.7
                         animations:^{
                             //what you would like to animate
                             sender.view.frame = CGRectMake(sender.view.frame.origin.x - 120,sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);
                         }completion:^(BOOL finished){
                             [UIView animateWithDuration:.2
                                              animations:^{
                                                  
                                                  sender.view.frame = CGRectMake(sender.view.frame.origin.x + 20,sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height); }];
                             
                         }];
        
        
    } else {
        //made below instant code and then added animation instead
//        CGRect newFrameX = sender.view.frame;
//        newFrameX.origin.x = sender.view.frame.origin.x + 100;
//        sender.view.frame = newFrameX;
        [UIView animateWithDuration:.7
                         animations:^{
                             //what you would like to animate
                             sender.view.frame = CGRectMake(sender.view.frame.origin.x + 120,sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);
                         }completion:^(BOOL finished){
                             [UIView animateWithDuration:.2
                                              animations:^{
                                                  
                                                  sender.view.frame = CGRectMake(sender.view.frame.origin.x - 20,sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height); }];
                         }];
    }
    
}
// on left swipe //in the gesture recognizer you will move the origin of the white view along the x axis only in line with the swipe (up to a max of say 150 points) -if statement)
//on right swipe do the opposite up to the y value of the superview ?


@end
