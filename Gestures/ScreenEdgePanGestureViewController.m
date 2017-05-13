//
//  ScreenEdgePanGestureViewController.m
//  Gestures
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ScreenEdgePanGestureViewController.h"

@interface ScreenEdgePanGestureViewController () <UIGestureRecognizerDelegate>

@property (nonatomic) BOOL viewIsShowing;

@end

@implementation ScreenEdgePanGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //create a view (larger box this time, maybe 400 x 400) and set it up so that its x value is equal to the right edge of the superview -20 or so
    //add it to the super view
    //ib action to handle gestures that accepts a sender, you can check class of sender and create
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) + self.view.bounds.size.width/2-10,CGRectGetMidY(self.view.bounds)-self.view.bounds.size.width/2,self.view.frame.size.width/4*3, self.view.frame.size.height/2)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    UIScreenEdgePanGestureRecognizer *screenEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(screenEdgePanGestureRecognizer:)];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizer)];
    [view addGestureRecognizer:screenEdgeGesture];
    [view addGestureRecognizer:panGestureRecognizer];
    panGestureRecognizer.delegate = self;
    screenEdgeGesture.delegate = self;
    
}

//- (BOOL) gestureRecognizer: (UIGestureRecognizer *) gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer: (UIGestureRecognizer *) otherGestureRecognizer {
//    return NO;
//}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    
//}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // If the gesture recognizer is a UITapGestureRecongizer, but the other
    // gesture detected is a UILongPressGestureRecognizer, require the
    // UITapGestureRecognizer to fail.
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] &&
        [otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]] && self.viewIsShowing == NO) {
        return YES;
    } else {
        return NO;
    }
}
    
    
    






- (IBAction)panGestureRecognizer:(UIPanGestureRecognizer *)sender {
    NSLog(@"ready to pan");
    //disable self enable other
    
}

- (IBAction)screenEdgePanGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)sender {
    NSLog(@"ready to edge pan");
    
    
    
}

@end
