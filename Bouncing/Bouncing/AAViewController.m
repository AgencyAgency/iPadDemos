//
//  AAViewController.m
//  Bouncing
//
//  Created by Kyle Oba on 9/13/13.
//  Copyright (c) 2013 Kyle Oba. All rights reserved.
//

#import "AAViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AAViewController ()
@property (weak, nonatomic) IBOutlet UIView *ballView;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ballXConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ballYConstraint;
@property (assign, nonatomic) CGPoint velocity;
@end

@implementation AAViewController

- (void)tick:(CADisplayLink *)sender
{
    CGPoint vel = self.velocity;
    if (CGRectGetMaxX(self.ballView.frame) >= CGRectGetMaxX(self.view.bounds)) {
        vel.x = -ABS(vel.x);
    } else if (CGRectGetMinX(self.ballView.frame) <= CGRectGetMinX(self.view.bounds)) {
        vel.x = ABS(vel.x);
    }
    if (CGRectGetMaxY(self.ballView.frame) >= CGRectGetMaxY(self.view.bounds)) {
        vel.y = -ABS(vel.y);
    } else if (CGRectGetMinY(self.ballView.frame) <= CGRectGetMinY(self.view.bounds)) {
        vel.y = ABS(vel.y);
    }
    self.velocity = vel;
    
    CGPoint pos = CGPointMake(self.ballXConstraint.constant,
                              self.ballYConstraint.constant);
    self.ballXConstraint.constant = pos.x + self.velocity.x;
    self.ballYConstraint.constant = pos.y + self.velocity.y;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.velocity = CGPointMake(10.0, 10.0);
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

@end
