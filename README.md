LSButton
==============================
Long shadow button for iOS

<img src="./sample.gif" alt="Screenshot" />

Installation
------------
Just copy LSButton.h,LSButton.m into your project.

Usage
-----
*With storyboard*  
Chnage the UIButton class to LSButton.  
And set the image.  


*With code*  
`+ (LSButton *)buttonWithFrame:(CGRect)frame icon:(UIImage*)icon buttonColor:(UIColor*)buttonColor shadowColor:(UIColor*)shadowColor tintColor:(UIColor*)tintColor radius:(CGFloat)radius angel:(CGFloat)angel target:(id)tar action:(SEL)sel;`
