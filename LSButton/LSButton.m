//
//  LSButton.m
//  LSButton
//
//  Created by Yang on 2015/01/16.
//  Copyright (c) 2015年 Yang. All rights reserved.
//

#import "LSButton.h"

@implementation LSButton

+(LSButton *)buttonWithFrame:(CGRect)frame icon:(UIImage*)icon buttonColor:(UIColor *)buttonColor shadowColor:(UIColor *)shadowColor tintColor:(UIColor*)tintColor radius:(CGFloat)radius angel:(CGFloat)angel target:(id)tar action:(SEL)sel
{
    LSButton *button = [LSButton new];
    button.frame = frame;
    button.buttonColor = buttonColor;
    button.shadowColor = shadowColor;
    button.tintColor = tintColor;
    button.radius = radius;
    button.angel = angel;
    [button setImage:icon forState:UIControlStateNormal];
    [button addTarget:tar action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
        [self setup];
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

-(void)setup
{
    if (!self.buttonColor) self.buttonColor = [UIColor colorWithRed:0.400 green:0.800 blue:1.000 alpha:1.000];
    if (!self.shadowColor) self.shadowColor = [UIColor colorWithWhite:0.326 alpha:1.000];
    if (!self.angel) self.angel = 45;
    self.backgroundColor = [UIColor clearColor];
}

-(void)setRadius:(CGFloat)radius
{
    _radius = MIN(radius, self.frame.size.width / 2.0);
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //Set image always tint
    if (self.currentImage) [self setImage:[self.currentImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
}

- (void)drawRect:(CGRect)rect
{
    
    [self.buttonColor setFill];
    UIBezierPath *p = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.radius];
    [p fill];
    [p addClip];
    
    if (self.currentImage)
    {
        //Start point
        CGPoint point = self.imageView.frame.origin;
        [self.shadowColor setFill];
        
        CGFloat radian = _angel / 180 * M_PI;
        CGFloat x,y;
        if (fabs(sin(radian)) >= fabs(cos(radian)))
        {
            x = cos(radian) * ( 1 / fabs(sin(radian)));
            y = 1 * ( sin(radian) < 0 ? -1 : 1 );
        }
        else
        {
            x = 1 * ( cos(radian) < 0 ? -1 : 1 );
            y = sin(radian) * ( 1 / fabs(cos(radian)));
        }
        
        while (true)
        {
            [self.currentImage drawAtPoint:point];
            
            if (CGRectContainsPoint(rect, point) ||
                CGRectContainsPoint(rect,CGPointMake(point.x + self.currentImage.size.width, point.y + self.currentImage.size.height)) ||
                CGRectContainsPoint(rect,CGPointMake(point.x + self.currentImage.size.width, point.y)) ||
                CGRectContainsPoint(rect,CGPointMake(point.x , point.y + self.currentImage.size.height)))
            {
                point = CGPointMake(point.x + x, point.y + y);
            }
            else
            {
                break;
            }
        }
    }
}

@end
