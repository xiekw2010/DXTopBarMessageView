//
//  UIViewController+TopBarMessage.m
//  DXTopBarMessageView
//
//  Created by xiekw on 14-3-17.
//  Copyright (c) 2014年 xiekw. All rights reserved.
//

#import "UIViewController+TopBarMessage.h"
#import <objc/runtime.h>

@interface  TopWarningView()

@property (nonatomic, strong) UILabel *label;

@end

@implementation TopWarningView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1];
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.textColor = [UIColor whiteColor];
        self.label.font = [UIFont systemFontOfSize:20.0f];
        self.label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.label];
        
        self.iconIgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_error"]];
        [self addSubview:self.iconIgv];
    }
    return self;
}

- (void)layoutSubviews
{
    CGSize textSize = [self.label.text sizeWithFont:self.label.font constrainedToSize:CGSizeMake(CGRectGetWidth(self.bounds) * 0.9, 20.f) lineBreakMode:NSLineBreakByTruncatingTail];
    CGFloat betweenIconAndText  = 10.0f;
    CGFloat iconWidth = 20.0f;
    if (!self.iconIgv.image) {
        iconWidth = 0.0f;
    }
    self.iconIgv.frame = CGRectMake((CGRectGetWidth(self.bounds) - (textSize.width + iconWidth + betweenIconAndText)) * 0.5, (CGRectGetHeight(self.bounds) - iconWidth) * 0.5, iconWidth, iconWidth);
    self.label.frame = CGRectMake(CGRectGetMaxX(self.iconIgv.frame) + betweenIconAndText, (CGRectGetHeight(self.bounds) - textSize.height) * 0.5, textSize.width, textSize.height);
}

- (void)setWarningText:(NSString *)warningText
{
    _warningText = warningText;
    self.label.text = _warningText;
    [self setNeedsLayout];
}

- (void)removeFromSuperview
{
    CGRect selfFrame = self.frame;
    selfFrame.origin.y -= CGRectGetHeight(selfFrame);
    
    [UIView animateWithDuration:0.25f animations:^{
        self.frame = selfFrame;
        self.alpha = 0.3;
    } completion:^(BOOL finished) {
        [super removeFromSuperview];
    }];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview) {
        self.alpha = 1.0;
        CGRect selfFrame = self.frame;
        selfFrame.origin.y -= CGRectGetHeight(selfFrame);
        self.frame = selfFrame;
        selfFrame.origin.y = 1;
        
        [UIView animateWithDuration:0.25f animations:^{
            self.frame = selfFrame;
        } completion:^(BOOL finished) {
            [super willMoveToSuperview:newSuperview];
        }];
    }else {
        [super willMoveToSuperview:newSuperview];
    }
}

@end

static char TopWarningKey;

@implementation UIViewController (TopBarMessage)

- (void)showTopMessage:(NSString *)warningText
{
    TopWarningView *topV = objc_getAssociatedObject(self, &TopWarningKey);
    if (!topV) {
        topV = [[TopWarningView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44)];
        objc_setAssociatedObject(self, &TopWarningKey, topV, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    topV.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44);
    topV.warningText = warningText;
    [self.view addSubview:topV];
    
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [topV removeFromSuperview];
    });
}


@end
