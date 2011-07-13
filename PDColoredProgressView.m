//
//  PDColoredProgressView.m
//  PDColoredProgressViewDemo
//
//  Created by Pascal Widdershoven on 03-01-09.
//  Copyright 2009 Pascal Widdershoven. All rights reserved.
//  

#import "PDColoredProgressView.h"
#import "drawing.m"


@implementation PDColoredProgressView

- (id) initWithCoder: (NSCoder*)aDecoder
{
	if(self=[super initWithCoder: aDecoder])
	{
		[self setTintColor: RGBACOLOR(43,134,225,1)];
		[self setBackgroundColor: RGBACOLOR(255,255,255,1)];
	}
	return self;
}

- (id) initWithProgressViewStyle: (UIProgressViewStyle) style
{
	if(self=[super initWithProgressViewStyle: style])
	{
		[self setTintColor: RGBACOLOR(43,134,225,1)];
		[self setBackgroundColor: RGBACOLOR(255,255,255,1)];
	}
	
	return self;
}

- (void)drawRect:(CGRect)rect
{	
	if([self progressViewStyle] == UIProgressViewStyleDefault)
	{
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		
		//draw first white layer
		addRoundedRectToPath(ctx, rect, 4, 4);
		CGContextClip(ctx);
		
		CGContextSetFillColorWithColor(ctx, [_backgroundColor CGColor]);
		CGContextFillRect(ctx, rect);
		
		//draw lower gray line
    CGContextSetStrokeColorWithColor(ctx, RGBACOLOR(178,178,178,0.9).CGColor);
		CGContextSetLineWidth(ctx, 2);
		CGContextMoveToPoint(ctx, 2.2, rect.size.height);
		CGContextAddLineToPoint(ctx, rect.size.width - 2.2, rect.size.height);
		CGContextStrokePath(ctx);
		
		//fill upperhalf with light grey
		CGRect upperhalf = rect;
		upperhalf.size.height /= 1.75;
		upperhalf.origin.y = 0;
		
		CGContextSetFillColorWithColor(ctx, RGBACOLOR(202,202,202,.9).CGColor);
		CGContextFillRect(ctx, upperhalf);
		
		//fill a part of the upper half with a somewhat darker grey
		CGRect upperhalfTop = upperhalf;
		upperhalfTop.size.height /= 2.7;
		CGContextSetFillColorWithColor(ctx, RGBACOLOR(163,163,163,.8).CGColor);
		CGContextFillRect(ctx, upperhalfTop);
		
		//fill the progress part with our tintcolor
		//if(_tintColor == nil)
		//	_tintColor = [UIColor colorWithRed: 43.0/255.0 green: 134.0/255.0 blue: 225.0/255.0 alpha: 1];
		
		CGRect progressRect = rect;
		progressRect.size.width *= [self progress];
		
		addRoundedRectToPath(ctx, progressRect, 4, 4);
		CGContextClip(ctx);
		
		CGContextSetFillColorWithColor(ctx, [_tintColor CGColor]);
		CGContextFillRect(ctx, progressRect);
		
		progressRect.size.width -= 1.25;
		progressRect.origin.x += 0.625;
		progressRect.size.height -= 1.25;
		progressRect.origin.y += 0.625;
		
		addRoundedRectToPath(ctx, progressRect, 4, 4);
		CGContextClip(ctx);
		CGContextSetLineWidth(ctx, 1);
    CGContextSetStrokeColorWithColor(ctx, RGBACOLOR(20,20,20,0.6).CGColor);
		CGContextStrokeRect(ctx, progressRect);
		
		//draw white linear gradient over upperhalf
		CGFloat colors[8] = {
			1, 1, 1, 0.45,
			1, 1, 1, 0.75
		};
		
		fillRectWithLinearGradient(ctx, upperhalf, colors, 2, nil);
	}
	else
	{
		[super drawRect: rect];
	}
}

- (void) setTintColor: (UIColor *) aColor
{
	[_tintColor release];
	_tintColor = [aColor retain];
}

- (void) setBackgroundColor: (UIColor *) aColor
{
	[_backgroundColor release];
	_backgroundColor = [aColor retain];
}

- (void) moveProgress
{
    if (self.progress < _targetProgress)
	{
        self.progress = MIN(self.progress + 0.01, _targetProgress);
    }
    else if(self.progress > _targetProgress)
    {
        self.progress = MAX(self.progress - 0.01, _targetProgress);
    }
    else
	{
        [_progressTimer invalidate];
        _progressTimer = nil;
    }
}

- (void) setProgress:(CGFloat)newProgress animated:(BOOL)animated
{
    if (animated)
	{
        _targetProgress = newProgress;
        if (_progressTimer == nil)
		{
            _progressTimer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(moveProgress) userInfo:nil repeats:YES];
        }
    }
	else
	{
        self.progress = newProgress;
    }
}

- (void) dealloc
{
    [super dealloc];
	[_tintColor release];
}


@end
