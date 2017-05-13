//
//  ScreenEdgePanGestureViewController.m
//  Gestures
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ScreenEdgePanGestureViewController.h"

@interface ScreenEdgePanGestureViewController ()

@property (nonatomic) BOOL viewIsShowing;
@property (nonatomic) UIPanGestureRecognizer *pan;
@property (nonatomic) UIScreenEdgePanGestureRecognizer *screenEdge;

@end

@implementation ScreenEdgePanGestureViewController

//can this be refactored to handle checking in separate functions which take in an instance of the gesture sender as sender? then in each reognizer you pull out the logic

- (void)viewDidLoad {
    [super viewDidLoad];
   //create a view (larger box this time, maybe 400 x 400) and set it up so that its x value is equal to the right edge of the superview -20 or so
    //add it to the super view
    //ib action to handle gestures that accepts a sender, you can check class of sender and create
    self.viewIsShowing = NO;
    UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) + self.view.bounds.size.width/2-10,CGRectGetMidY(self.view.bounds)-self.view.bounds.size.width/2,self.view.frame.size.width/4*3, self.view.frame.size.height/2)];
    secondView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:secondView];
    
    UIScreenEdgePanGestureRecognizer *screenEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(screenEdgePanGestureRecognizer:)];
    screenEdgeGesture.edges = UIRectEdgeRight;
    self.screenEdge = screenEdgeGesture;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(screenEdgePanGestureRecognizer:)];
    self.pan = panGestureRecognizer;
    self.pan.enabled = NO;
    
    [secondView addGestureRecognizer:screenEdgeGesture];
    [secondView addGestureRecognizer:panGestureRecognizer];
//    panGestureRecognizer.delegate = self;
//    screenEdgeGesture.delegate = self;
    
}


- (IBAction)panGestureRecognizer:(UIPanGestureRecognizer *)sender {
    NSLog(@"ready to pan");
    //if bool ViewIsShowing = YES, then enable pan gesture
    if (self.viewIsShowing) {
    CGRect newFrame = sender.view.frame;
    newFrame.origin.x -= [sender locationInView:sender.view].x;
    sender.view.frame = newFrame;
        NSLog(@"x value is:%f",newFrame.origin.x);
    } else {
//        self.pan.enabled = NO;
//        self.screenEdge.enabled = YES;
    }
}

- (IBAction)screenEdgePanGestureRecognizer:(UIGestureRecognizer *)sender {
    NSLog(@"ready to edge pan");
    CGRect newFrame = sender.view.frame;
    
    
    if (!self.viewIsShowing) {
        if ([sender locationInView:self.view].x <= self.view.frame.size.width/3*2) {
            self.screenEdge.enabled = NO;
            newFrame.origin.x = self.view.frame.size.width/4*1;
            [UIView animateWithDuration:.2 animations:^{
                
                sender.view.frame = newFrame;

            }];
            
                    self.pan.enabled = YES;
            self.viewIsShowing = YES;
        } else {
        
            newFrame.origin.x += [sender locationInView:sender.view].x;
            //does the above act backwards because locationInView would be returning relative values?
            sender.view.frame = newFrame;
            
    
            
            if ((sender.state == UIGestureRecognizerStateEnded) && ([sender locationInView:self.view].x >= self.view.frame.size.width/3*2)) {
                newFrame.origin.x = CGRectGetMidX(self.view.bounds) + self.view.bounds.size.width/2-10;
                
                [UIView animateWithDuration:.2 animations:^{
                    
                    sender.view.frame = newFrame;
                    
                }];

                
            }
            //if newframe.origin.x = self.view.size.whatever 1/4 of the screen is the end goal, 1/2 the screen is the threshold.
            //need to do some sort of check for state of screenedge pan touch (ended?
            
            
            NSLog(@"x value is:%f",[sender locationInView:self.view].x);

            
        }
    } else {
        
        if ([sender locationInView:self.view].x >= self.view.frame.size.width/3*2) {
            self.pan.enabled = NO;
            newFrame.origin.x = CGRectGetMidX(self.view.bounds) + self.view.bounds.size.width/2-10;
            
                [UIView animateWithDuration:.2 animations:^{
                
                sender.view.frame = newFrame;
                
            }];
            
            self.screenEdge.enabled = YES;
            self.viewIsShowing = NO;
        } else {
            
            newFrame.origin.x += [sender locationInView:sender.view].x;
            //does the above act backwards because locationInView would be returning relative values?
            sender.view.frame = newFrame;
            //if newframe.origin.x = self.view.size.whatever 1/4 of the screen is the end goal, 1/2 the screen is the threshold.
            //need to do some sort of check for state of screenedge pan touch (ended?
            if ((sender.state == UIGestureRecognizerStateEnded) && ([sender locationInView:self.view].x <= self.view.frame.size.width/3*2)) {
                newFrame.origin.x = self.view.frame.size.width/4*1;
                
                [UIView animateWithDuration:.2 animations:^{
                    
                    sender.view.frame = newFrame;
                    
                }];
                
                
            }

            
            
            
            NSLog(@"x value is:%f",[sender locationInView:self.view].x);
            
    }
    }
}

//- (void)screenEdgePan {
//
//    
//    
//    
//}
    
    



@end
