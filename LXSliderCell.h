//
//  LXSliderCell.h
//  CoolBox
//
//  Created by liam on 26/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface LXSliderCell : NSSliderCell {
	BOOL isDown;
	NSImage *progressKnobImage;
}
- (void)drawKnob:(NSRect)knobRect;
@end