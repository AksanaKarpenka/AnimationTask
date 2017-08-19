//
//  ViewController.m
//  AnimationTask
//
//  Created by HomeStation on 8/16/17.
//  Copyright © 2017 AKS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)performScaleAnimation:(UIButton *)sender {
    [UIView animateWithDuration:0.3
                          delay:0.
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^(void) {
                         [self.view layoutIfNeeded];
                         self.animateScaleLabel.transform = CGAffineTransformScale(self.animateScaleLabel.transform, 1.2, 1.2);
                         self.animateScaleButton.transform = CGAffineTransformScale(self.animateScaleButton.transform, 1.6, 1.6);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.4
                                               delay:0.1
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^(void) {
                                              [self.view layoutIfNeeded];
                                              self.animateScaleLabel.transform = CGAffineTransformIdentity;
                                              self.animateScaleButton.transform = CGAffineTransformIdentity;
                                          }
                                          completion:nil];
                     }
     ];
}

- (IBAction)performMovementAnimation:(UIButton *)sender {
    self.animateMovementButton.enabled = NO;
    CGFloat animateMovementLabelOriginX = self.animateMovementLabel.frame.origin.x;
    CGFloat animateMovementLabelOriginY = self.animateMovementLabel.frame.origin.y;
    [UIView animateWithDuration:0.4
                     animations:^(void) {
                         self.animateMovementLabel.frame = CGRectMake((self.view.frame.size.width - self.animateMovementLabel.bounds.size.width) - 50, self.animateMovementLabel.frame.origin.y, self.animateMovementLabel.bounds.size.width, self.animateMovementLabel.bounds.size.height);
                     }];
    [UIView animateWithDuration:0.4
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^(void) {
                                                  self.animateMovementLabel.frame = CGRectMake(self.animateMovementLabel.frame.origin.x, self.animateMovementButton.frame.origin.y - self.animateMovementLabel.frame.size.width - 50, self.animateMovementLabel.bounds.size.width, self.animateMovementLabel.bounds.size.height);
                     }
                     completion:nil];
    [UIView animateWithDuration:0.5
                          delay:1.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         self.animateMovementLabel.frame = CGRectMake(animateMovementLabelOriginX, self.animateMovementButton.frame.origin.y - self.animateMovementLabel.frame.size.width - 50, self.animateMovementLabel.bounds.size.width, self.animateMovementLabel.bounds.size.height);
                     }
                     completion:nil];
    [UIView animateWithDuration:0.5
                          delay:2.1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void) {
                         self.animateMovementLabel.frame = CGRectMake(animateMovementLabelOriginX, animateMovementLabelOriginY, self.animateMovementLabel.bounds.size.width, self.animateMovementLabel.bounds.size.height);
                     }
                     completion:^(BOOL finished) {
                         self.animateMovementButton.enabled = YES;
                     }];
}

- (IBAction)performRotationAnimation:(UIButton *)sender {
    [UIView transitionWithView:self.view
                      duration:0.2
                       options:UIViewAnimationOptionCurveLinear
                    animations:^(void) {
                        self.animateRotationButton.transform = CGAffineTransformRotate(self.animateRotationButton.transform, M_PI * (0.1));
                        self.animateRotationLabel.transform = CGAffineTransformRotate(self.animateRotationLabel.transform, M_PI * (0.1));
                    }
                    completion:^(BOOL finished) {
                        [UIView transitionWithView:self.view
                                          duration:0.2
                                           options:UIViewAnimationOptionCurveLinear
                                        animations:^(void) {
                                            self.animateRotationButton.transform = CGAffineTransformRotate(self.animateRotationButton.transform, M_PI * (-0.1));
                                            self.animateRotationLabel.transform = CGAffineTransformRotate(self.animateRotationLabel.transform, M_PI * (-0.1));
                                        }
                                        completion:nil];
                    }];
    
    [UIView transitionWithView:self.view
                      duration:0.2
                       options:UIViewAnimationOptionCurveEaseOut
                    animations:^(void) {
                        [UIView setAnimationDelay:0.4];
                        self.animateRotationButton.transform = CGAffineTransformRotate(self.animateRotationButton.transform, M_PI * (-0.1));
                        self.animateRotationLabel.transform = CGAffineTransformRotate(self.animateRotationLabel.transform, M_PI * (-0.1));
                    }
                    completion:^(BOOL finished) {
                        [UIView transitionWithView:self.view
                                          duration:0.2
                                           options:UIViewAnimationOptionCurveEaseIn
                                        animations:^(void) {
                                            self.animateRotationButton.transform = CGAffineTransformRotate(self.animateRotationButton.transform, M_PI * 0.1);
                                            self.animateRotationLabel.transform = CGAffineTransformRotate(self.animateRotationLabel.transform, M_PI * 0.1);
                                        }
                                        completion:nil];
                    }];
}

- (IBAction)performDynamicAnimation:(UIButton *)sender {

    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.dynamicAnimateLabel]];
    [self.animator addBehavior:gravityBehavior];
    
    self.collision = [[UICollisionBehavior alloc] initWithItems:@[self.dynamicAnimateLabel]];
    
    CGPoint barrierEdge = CGPointMake(self.barrierLabel.frame.size.width + self.barrierLabel.frame.origin.x, self.barrierLabel.frame.origin.y);
    [self.collision addBoundaryWithIdentifier:@"barrier"
                                fromPoint:self.barrierLabel.frame.origin
                                  toPoint:barrierEdge];

    [self.animator addBehavior:self.collision];
}

@end
