//
//  ViewController.h
//  AnimationTask
//
//  Created by HomeStation on 8/16/17.
//  Copyright © 2017 AKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *animateScaleButton;
@property (weak, nonatomic) IBOutlet UILabel *animateScaleLabel;
@property (weak, nonatomic) IBOutlet UIButton *animateMovementButton;
@property (weak, nonatomic) IBOutlet UILabel *animateMovementLabel;
@property (weak, nonatomic) IBOutlet UIButton *animateRotationButton;
@property (weak, nonatomic) IBOutlet UILabel *animateRotationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dynamicAnimateLabel;
@property (weak, nonatomic) IBOutlet UIButton *dynamicAnimateButton;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UICollisionBehavior *collision;
@property (weak, nonatomic) IBOutlet UILabel *barrierLabel;

- (IBAction)performScaleAnimation:(UIButton *)sender;
- (IBAction)performMovementAnimation:(UIButton *)sender;
- (IBAction)performRotationAnimation:(UIButton *)sender;
- (IBAction)performDynamicAnimation:(UIButton *)sender;

@end

