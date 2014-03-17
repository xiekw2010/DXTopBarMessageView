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

@end

@interface UIViewController (TopBarMessage)

- (void)showTopMessage:(NSString *)warningText;

@end
