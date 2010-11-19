//
//  PDColoredProgressView.h
//  PDColoredProgressViewDemo
//
//  Created by Pascal Widdershoven on 03-01-09.
//
// This code is distributed under the terms and conditions of the MIT license. 
//
// Copyright (c) 2009 Pascal Widdershoven
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// If you implement this class a comment on my blog (http://pwiddershoven.nl/blog/2009/01/04/colored-uiprogressview.html)
// or mentioning in the App Store description is appreciated, but not required.

#import <UIKit/UIKit.h>


@interface PDColoredProgressView : UIProgressView {
	UIColor *_tintColor;
    NSTimer *_progressTimer;
    CGFloat _targetProgress;
}

/**
 Set the desired tintColor for this control
 **/
- (void) setTintColor: (UIColor *) aColor;

/**
 Set progress value with option animation
 **/
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end