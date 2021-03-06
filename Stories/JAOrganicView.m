//
//  JAOrganicView.m
//  Stories
//
//  Created by Antonin Langlade on 27/11/2014.
//  Copyright (c) 2014 Jb & Anto. All rights reserved.
//

#import "JAOrganicView.h"

@implementation JAOrganicView{
    NSString *firstStepOrganic;
    NSString *middleStepOrganic;
    NSString *endStepOrganic;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {

//        self.paths = paths;

        self.organicLayer = [CAShapeLayer layer];
        
        
        
        
        
        if(IS_IPHONE_6){
            self.organicLayer.transform = CATransform3DMakeScale(1.175, 1.175, 1);
        }
        else if(IS_IPHONE_6P){
            self.organicLayer.transform = CATransform3DMakeScale(1.3, 1.3, 1);
        }
        
        [self.layer addSublayer:self.organicLayer];

    }
    return self;
    
}
-(void)setPaths:(NSArray *)paths{
    
    firstStepOrganic = [paths objectAtIndex:0];
    middleStepOrganic = [paths objectAtIndex:1];
    endStepOrganic = [paths objectAtIndex:2];
    
    self.organicLayer.path = [PocketSVG pathFromSVGFileNamed:firstStepOrganic];
}
-(void)middleAnimation{
    CGPathRef first = [PocketSVG pathFromSVGFileNamed:firstStepOrganic];
    CGPathRef middle = [PocketSVG pathFromSVGFileNamed:middleStepOrganic];
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.duration = 1.2;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.timingFunction = CreateCAMediaTimingFunction(0.19, 1, 0.22, 1);
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.fromValue = (__bridge id)(first);
    pathAnimation.toValue = (__bridge id)(middle);
    
    [self.organicLayer addAnimation:pathAnimation forKey:@"pathAnimation"];
}
-(void)finalAnimation:(void (^)())completion{
    
    CGPathRef middle = [PocketSVG pathFromSVGFileNamed:middleStepOrganic];
    CGPathRef final = [PocketSVG pathFromSVGFileNamed:endStepOrganic];
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.duration = 1.2;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.timingFunction = CreateCAMediaTimingFunction(0.19, 1, 0.22, 1);
    pathAnimation.fromValue = (__bridge id)(middle);
    pathAnimation.toValue = (__bridge id)(final);

    [self.organicLayer addAnimation:pathAnimation forKey:@"pathAnimation"];
    

    [self performSelector:@selector(fireBlockAfterDelay:)
               withObject:completion
               afterDelay:1.2];
    
}
- (void)fireBlockAfterDelay:(void (^)(void))block {
    block();
}
-(void)resetAnimation{
  
    CGPathRef first = [PocketSVG pathFromSVGFileNamed:firstStepOrganic];
    CGPathRef middle = [PocketSVG pathFromSVGFileNamed:middleStepOrganic];
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.duration = 0.01;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.timingFunction = CreateCAMediaTimingFunction(0.19, 1, 0.22, 1);
    pathAnimation.fromValue = (__bridge id)(middle);
    pathAnimation.toValue = (__bridge id)(first);
    
    [self.organicLayer addAnimation:pathAnimation forKey:@"pathAnimation"];

}
-(void)reverseAnimation:(void (^)(void))block {
    
    void (^block_)() = [block copy]; // autorelease this if you're not using ARC
    [self performSelector:@selector(performBlock:) withObject:block_ afterDelay:.5];
    [CATransaction begin]; {
        [CATransaction setCompletionBlock:^{

        }];
        CGPathRef final = [PocketSVG pathFromSVGFileNamed:endStepOrganic];
        CGPathRef middle = [PocketSVG pathFromSVGFileNamed:middleStepOrganic];
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        pathAnimation.duration = 1.0;
        pathAnimation.removedOnCompletion = NO;
        pathAnimation.fillMode = kCAFillModeForwards;
        pathAnimation.timingFunction = CreateCAMediaTimingFunction(0.19, 1, 0.22, 1);
        pathAnimation.fromValue = (__bridge id)(final);
        pathAnimation.toValue = (__bridge id)(middle);
        [self.organicLayer addAnimation:pathAnimation forKey:@"pathAnimation"];
    } [CATransaction commit];

}
- (void)performBlock:(void (^)())block
{
    block();
}
-(void)setColor:(NSString *)color{
    [self.organicLayer setFillColor:[UIColor pxColorWithHexValue:color].CGColor];
}



@end
