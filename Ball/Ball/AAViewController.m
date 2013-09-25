//
//  AAViewController.m
//  Ball
//
//  Created by Kyle Oba on 9/13/13.
//  Copyright (c) 2013 Kyle Oba. All rights reserved.
//

#import "AAViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AAViewController ()
@property (weak, nonatomic) IBOutlet UIView *ballView;
@end

@implementation AAViewController

- (void)tick:(CADisplayLink *)sender
{
    CGPoint pos = self.ballView.center;
    pos.x += 10.0f;
    self.ballView.center = pos;
}


@end
