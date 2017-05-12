//
//  PanGestureViewController.m
//  Gestures
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "PanGestureViewController.h"

@interface PanGestureViewController ()

@end

@implementation PanGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)panGestureRecognized:(id)sender {
}
- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    
    CGPoint locationInView = [sender locationInView:self.view];
    sender.view.center = locationInView;
   
    //using translation in view just gives you the change value - outcome is the same. just need to remember to set the translation to zero everytime it is called.
//    CGPoint translation = [sender translationInView:self.view];
//    CGPoint oldCenter = sender.view.center;
//    CGPoint newCenter = CGPointMake((oldCenter.x+translation.x), (oldCenter.y + translation.y));
//    sender.view.center = newCenter;
//    [sender setTranslation:CGPointZero inView:self.view];
    
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
