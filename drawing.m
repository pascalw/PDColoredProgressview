//
//  drawing.m
//  PDColoredProgressViewDemo
//
//  Created by Pascal Widdershoven on 03-01-09.
//  Copyright 2009 P-development. All rights reserved.
//

/* 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Computer, Inc. ("Apple") in consideration of your agreement to the
 following terms, and your use, installation, modification or
 redistribution of this Apple software constitutes acceptance of these
 terms.  If you do not agree with these terms, please do not use,
 install, modify or redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software. 
 Neither the name, trademarks, service marks or logos of Apple Computer,
 Inc. may be used to endorse or promote products derived from the Apple
 Software without specific prior written permission from Apple.  Except
 as expressly stated in this notice, no other rights or licenses, express
 or implied, are granted by Apple herein, including but not limited to
 any patent rights that may be infringed by your derivative works or by
 other works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2005 Apple Computer, Inc., All Rights Reserved
 
 @source http://developer.apple.com/mac/library/samplecode/QuartzShapes/listing10.html
 See license above
 */ 
 
static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
								 float ovalHeight)
{
	float fw, fh;
	// If the width or height of the corner oval is zero, then it reduces to a right angle,
	// so instead of a rounded rectangle we have an ordinary one.
	if (ovalWidth == 0 || ovalHeight == 0) {
		CGContextAddRect(context, rect);
		return;
	}
	
	//  Save the context's state so that the translate and scale can be undone with a call
	//  to CGContextRestoreGState.
	CGContextSaveGState(context);
	
	//  Translate the origin of the contex to the lower left corner of the rectangle.
	CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
	
	//Normalize the scale of the context so that the width and height of the arcs are 1.0
	CGContextScaleCTM(context, ovalWidth, ovalHeight);
	
	// Calculate the width and height of the rectangle in the new coordinate system.
	fw = CGRectGetWidth(rect) / ovalWidth;
	fh = CGRectGetHeight(rect) / ovalHeight;
	
	// CGContextAddArcToPoint adds an arc of a circle to the context's path (creating the rounded
	// corners).  It also adds a line from the path's last point to the begining of the arc, making
	// the sides of the rectangle.
	CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
	CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
	CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
	CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
	CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
	
	// Close the path
	CGContextClosePath(context);
	
	// Restore the context's state. This removes the translation and scaling
	// but leaves the path, since the path is not part of the graphics state.
	CGContextRestoreGState(context);
}

static void fillRectWithLinearGradient(CGContextRef context, CGRect rect, CGFloat colors[], int numberOfColors, CGFloat locations[]) {
	CGContextSaveGState(context);
	
	if(!CGContextIsPathEmpty(context))
		CGContextClip(context);
	
	CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
	CGPoint start = CGPointMake(0, 0);
	CGPoint end = CGPointMake(0, rect.size.height);
	
	CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, colors, locations, numberOfColors);
	CGContextDrawLinearGradient(context, gradient, end, start, 0);
	CGContextRestoreGState(context);
	
	CGColorSpaceRelease(space);
	CGGradientRelease(gradient);
}
