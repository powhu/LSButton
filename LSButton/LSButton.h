//
//  LSButton.h
//  LSButton
//
//  Created by Yang on 2015/01/16.
//  Copyright (c) 2015 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface LSButton : UIButton

@property (nonatomic,strong) IBInspectable UIColor *buttonColor;
@property (nonatomic,strong) IBInspectable UIColor *shadowColor;
@property (nonatomic) IBInspectable CGFloat radius;
@property (nonatomic) IBInspectable CGFloat angel;


+ (LSButton *)buttonWithFrame:(CGRect)frame
                         icon:(UIImage*)icon
                  buttonColor:(UIColor*)buttonColor
                  shadowColor:(UIColor*)shadowColor
                    tintColor:(UIColor*)tintColor
                       radius:(CGFloat)radius
                        angel:(CGFloat)angel
                      target:(id)tar
                      action:(SEL)sel;
@end
