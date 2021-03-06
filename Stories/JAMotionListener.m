//
//  JAMotionManager.m
//  Stories
//
//  Created by Jean-baptiste PENRATH on 06/01/2015.
//  Copyright (c) 2015 Jb & Anto. All rights reserved.
//

#import "JAMotionListener.h"

@interface JAMotionListener() {
    int count;
    CGFloat gyroMax;
    CGFloat max;
    CGFloat maxRoll;
    BOOL isFlipped;
}
@end

@implementation JAMotionListener

@synthesize delegate;
@synthesize motionManager;

- (id)init {
    
    self = [super init];
    
    if(self == nil) {
        return nil;
    }
    
    [self resetVariables];
    motionManager = [CMMotionManager new];
    [motionManager setDeviceMotionUpdateInterval:0.05];
    [motionManager setGyroUpdateInterval:0.05];
    [motionManager startDeviceMotionUpdates];
    [motionManager startGyroUpdates];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(getValues:) userInfo:nil repeats:YES];
    
    return self;
    
}

- (void)getValues:(NSTimer *)timer
{
    if(count < 10) {
        count++;
        
        if(motionManager.gyroData.rotationRate.y > max) {
            max = motionManager.gyroData.rotationRate.y;
        }
        
        if(motionManager.deviceMotion.attitude.roll < maxRoll) {
            maxRoll = motionManager.deviceMotion.attitude.roll;
        }
        
        if((maxRoll < -2.3 || maxRoll > 2.3)  && max > 8 && !isFlipped) {
            isFlipped = YES;
            [self deviceFlipped];
        }
        
    } else {
        [self resetVariables];
    }
    
}

- (void)deviceFlipped {
    [delegate deviceDidFlipped];
}

- (void)resetVariables {
    count = 0;
    max = 0;
    maxRoll = 0;
    isFlipped = NO;
}

@end
