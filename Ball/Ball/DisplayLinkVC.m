//
//  DisplayLinkVC.m
//  Ball
//
//  Created by Kyle Oba on 9/13/13.
//  Copyright (c) 2013 Kyle Oba. All rights reserved.
//

#import "DisplayLinkVC.h"
#import <QuartzCore/QuartzCore.h>

@interface DisplayLinkVC ()
@property (strong, nonatomic) CADisplayLink *displayLink;
@end

@implementation DisplayLinkVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    self.displayLink.frameInterval = 2;
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)tick:(CADisplayLink *)sender
{
    
}

@end
