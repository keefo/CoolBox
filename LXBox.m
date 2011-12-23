//
//  LXBox.m
//  CoolBox
//
//  Created by liam on 26/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LXBox.h"
#import "constant.h"

@implementation LXBox

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib
{
	basecolor=BASECOLOR;
	if([basecolor redComponent]<0.1)
	{
		edgecolor=[NSColor colorWithCalibratedRed:[basecolor redComponent]*11 green:[basecolor greenComponent]*11 blue:[basecolor blueComponent]*11 alpha:1.0f];
	}
	else{
		edgecolor=[NSColor colorWithCalibratedRed:[basecolor redComponent]*1.7 green:[basecolor greenComponent]*1.7 blue:[basecolor blueComponent]*1.7 alpha:1.0f];
	}
	
}

- (void)drawRect:(NSRect)aRect {
	
	{
		NSRect newRect;
		newRect.origin.x        = aRect.origin.x;
		newRect.origin.y        = aRect.origin.y;
		newRect.size.height     = aRect.size.height;
		newRect.size.width		= aRect.size.width;
		NSRect rect_lt = NSInsetRect(newRect, RADIUS_LT, RADIUS_LT);
		NSRect rect_lb = NSInsetRect(newRect, RADIUS_LB, RADIUS_LB);
		NSRect rect_rt = NSInsetRect(newRect, RADIUS_RT, RADIUS_RT);
		NSRect rect_rb = NSInsetRect(newRect, RADIUS_RB, RADIUS_RB);
		
		NSBezierPath* path = [NSBezierPath bezierPath];
		[path appendBezierPathWithArcWithCenter:NSMakePoint(NSMinX(rect_lb), NSMinY(rect_lb)) radius:RADIUS_LB startAngle:180.0 endAngle:270.0];
		[path appendBezierPathWithArcWithCenter:NSMakePoint(NSMaxX(rect_rb), NSMinY(rect_rb)) radius:RADIUS_RB startAngle:270.0 endAngle:360.0];
		[path appendBezierPathWithArcWithCenter:NSMakePoint(NSMaxX(rect_rt), NSMaxY(rect_rt)) radius:RADIUS_RT startAngle:  0.0 endAngle: 90.0];
		[path appendBezierPathWithArcWithCenter:NSMakePoint(NSMinX(rect_lt), NSMaxY(rect_lt)) radius:RADIUS_LT startAngle: 90.0 endAngle:180.0];
		[path closePath];

		[[NSColor colorWithCalibratedRed:0.8f green:0.8f blue:0.8f alpha:0.8] set];
		[path fill];

		NSGradient *g=[[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.0f alpha:1.0f] endingColor:[NSColor colorWithCalibratedRed:0.8f green:0.8f blue:0.8f alpha:0.8f]];
		[g drawInBezierPath:path angle:270];
		
		[[NSColor clearColor] set];
	}
	
	float midy=aRect.size.height*MIDPOSITION/100.0;
	NSRect newRect;
	newRect.origin.x        = aRect.origin.x+1;
	newRect.size.width		= aRect.size.width-2;
	
	if(midy>0)
	{
		newRect.size.height   = aRect.size.height-1-midy;
		newRect.origin.y	  = midy;
		
		NSRect rect_lt = NSInsetRect(newRect, RADIUS_LT, RADIUS_LT);
		NSRect rect_rt = NSInsetRect(newRect, RADIUS_RT, RADIUS_RT);
		
		NSBezierPath* path = [NSBezierPath bezierPath];
		
		NSPoint point1 = NSMakePoint(1,midy);
		[path appendBezierPathWithPoints:&point1 count:1];
		point1 = NSMakePoint(aRect.size.width-1,midy);
		[path appendBezierPathWithPoints:&point1 count:1];
		[path appendBezierPathWithArcWithCenter:NSMakePoint(NSMaxX(rect_rt), NSMaxY(rect_rt)) radius:RADIUS_RT startAngle:  0.0 endAngle: 90.0];
		[path appendBezierPathWithArcWithCenter:NSMakePoint(NSMinX(rect_lt), NSMaxY(rect_lt)) radius:RADIUS_LT startAngle: 90.0 endAngle:180.0];
		[path closePath];
		
		NSGradient *g=[[[NSGradient alloc] initWithStartingColor:[edgecolor retain]
													 endingColor:[basecolor retain]] autorelease];
		[g drawInBezierPath:path angle:270.0];

		[[NSColor clearColor] set];
	}

	{
		newRect.size.height     = midy+1;
		newRect.origin.y        = 1;
		NSRect rect_lb = NSInsetRect(newRect, RADIUS_LB, RADIUS_LB);
		NSRect rect_rb = NSInsetRect(newRect, RADIUS_RB, RADIUS_RB);
	
		NSBezierPath* path = [NSBezierPath bezierPath];
		[path appendBezierPathWithArcWithCenter:NSMakePoint(NSMinX(rect_lb), NSMinY(rect_lb)) radius:RADIUS_LB startAngle:180.0 endAngle:270.0];
		[path appendBezierPathWithArcWithCenter:NSMakePoint(NSMaxX(rect_rb), NSMinY(rect_rb)) radius:RADIUS_RB startAngle:270.0 endAngle:360.0];
		
		NSPoint point1 = NSMakePoint(aRect.size.width-1,newRect.size.height);	
		[path appendBezierPathWithPoints:&point1 count:1];
		point1 = NSMakePoint(1, newRect.size.height);
		[path appendBezierPathWithPoints:&point1 count:1];
		
		[path closePath];
		NSGradient *g=[[[NSGradient alloc] initWithStartingColor:edgecolor
													 endingColor:basecolor] autorelease];
		[g drawInBezierPath:path angle:90.0];
		[[NSColor clearColor] set];
	}
}

@end
