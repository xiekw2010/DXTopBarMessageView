//
//  UIViewController+TopBarMessage.h
//  DXTopBarMessageView
//
//  Created by xiekw on 14-3-17.
//  Copyright (c) 2014年 xiekw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopWarningView : UIView

@property (nonatomic, strong) NSString *warningText;
@property (nonatomic, strong) UIImageView *iconIgv;
@property (nonatomic, copy) dispatch_block_t tapHandler;
@property (nonatomic, assign) float dimissDelay;
@property (nonatomic, strong) UILabel *label;

- (void)resetViews;

@end

@interface UIViewController (TopBarMessage)

/**
 *  show the message with config the top bar
 *
 *  @param message    the text to show
 *  @param config     the top bar view config, the whole version will be @{kDXTopBarBackgroundColor:[UIColor blueColor], kDXTopBarTextColor : [UIColor yellowColor], kDXTopBarIcon : [UIImage imageNamed:@"icon.png"], kDXTopBarTextFont : [UIFont boldSystemFontOfSize:15.0]}
 *  @param delay      time to dismiss
 *  @param tapHandler the tap handler
 */
- (void)showTopMessage:(NSString *)message topBarConfig:(NSDictionary *)config dismissDelay:(float)delay withTapBlock:(dispatch_block_t)tapHandler;

/**
 *  Default style message something like Instagram does
 *
 *  @param message message to tell
 */
- (void)showTopMessage:(NSString *)message;

@end

extern NSString * const kDXTopBarBackgroundColor;
extern NSString * const kDXTopBarTextColor;
extern NSString * const kDXTopBarTextFont;
extern NSString * const kDXTopBarIcon;
