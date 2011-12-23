//
//  LXSliderCell.m
//  CoolBox
//
//  Created by liam on 26/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LXSliderCell.h"

@implementation LXSliderCell

-(id)init
{
    self = [super init];
	progressKnobImage = [NSImage imageNamed:@"knot.png"];
	[self setKnobThickness:[progressKnobImage size].width];
	return self;
}

- (void)drawKnob:(NSRect)knobRect
{	
	NSRect imgRect = NSMakeRect(0,0, [progressKnobImage size].width, [progressKnobImage size].height);
	NSRect krect = NSMakeRect(knobRect.origin.x+3.5, 1, [progressKnobImage size].width, [progressKnobImage size].height);
	[[self controlView] lockFocus];
	[progressKnobImage drawInRect:krect fromRect:imgRect operation:NSCompositeSourceOver fraction:1.0];
	
	[[self controlView] unlockFocus];
}

- (void)stopTracking:(NSPoint)lastPoint at:(NSPoint)stopPoint inView:
(NSView *)controlView mouseIsUp:(BOOL)flag
{
    isDown = NO;
    [self drawKnob];
    [super stopTracking:lastPoint at:stopPoint inView:controlView 
			  mouseIsUp:flag];
}

- (BOOL)startTrackingAt:(NSPoint)startPoint inView:(NSView *)controlView
{
    isDown = YES;
    [self drawKnob];
    return [super startTrackingAt:startPoint inView:controlView];
}


- (BOOL)continueTracking:(NSPoint)lastPoint at:(NSPoint)currentPoint inView:(NSView *)controlView
{
	[self drawKnob];
	return [super continueTracking:lastPoint at:currentPoint inView:controlView];
}


- (BOOL)_usesCustomTrackImage
{
	return YES;
}
+ (BOOL)prefersTrackingUntilMouseUp
{
	return YES;
}
@end
