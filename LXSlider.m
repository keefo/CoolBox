//
//  LXSlider.m
//  CoolBox
//
//  Created by liam on 26/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LXSlider.h"
#import "LXSliderCell.h"
#import "constant.h"

@implementation LXSlider


- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}


- (void)awakeFromNib
{
	LXSliderCell *acell=[[LXSliderCell alloc] init];
	[self setCell:acell];
	NSRect r=[self frame];
	r.size.height=SliderbarHeight;
	[self setFrame:r]; 
	LXSliderCell *cell=[self cell];
	[[cell controlView] setFrame:r];
	[cell setControlSize:NSMiniControlSize];
	basecolor=BASECOLOR;
	if([basecolor redComponent]<0.1)
	{
		barbgcolor=[NSColor colorWithCalibratedRed:0.5 green:0.5 blue:0.5 alpha:1.0f];
		barleftbgcolor=[NSColor colorWithCalibratedRed:0.18 green:0.18 blue:0.18 alpha:1.0f];
	}
	else{
		barbgcolor=[NSColor colorWithCalibratedRed:[basecolor redComponent]*0.3 green:[basecolor greenComponent]*0.3 blue:[basecolor blueComponent]*0.3 alpha:1.0f];
		barleftbgcolor=[NSColor colorWithCalibratedRed:0.4 green:0.4 blue:0.4 alpha:1.0f];
	}
}

- (void)drawRect:(NSRect)aRect 
{
	NSRectFillUsingOperation(aRect, NSCompositeDestinationOut);
	[[barbgcolor retain]  set]; 
	NSFrameRectWithWidth ( NSMakeRect (0,0,aRect.size.width, SliderbarHeight), 1 );
	[[barleftbgcolor retain] set];
	NSRect p=[(LXSliderCell*)[self cell] knobRectFlipped:YES]; 
	NSRectFill(NSMakeRect (1,1,p.origin.x+3.5, aRect.size.height-2));
	[super drawRect:aRect];
}

@end
