DXTopBarMessageView
===================

Sometimes we think the alert view is a little annoying when we alert again and again if there are some problems like the awful network.

Sometimes it will be more delightful if you show the message on the top of your viewController and then it dimiss automatically after a while.

If you have used instagram, maybe you will have a figure on that.

## This maybe is your solution 

A category base on UIViewController, easy to use and custom.

### How to use

1. Import "UIViewController+TopBarMessage.h" to your own viewController or the .pch file

2. If system version is >= iOS7, you must to set the viewController's edgesForExtendedLayout to UIRectEdgeNone, otherwise the viewControllers'view frame is different from iOS6;

		- (void)viewDidLoad
		{
			//Top message won't work without this setting;
			if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
			        self.edgesForExtendedLayout = UIRectEdgeNone;
			 
			[self showTopMessage:@"The net work is bad now, please check it"];
		}

### Maybe beyond your consideration

1. Support the device rotation, just use it.
2. In iOS7 it needs to change your viewController's property edgesForExtendedLayout to UIRectEdgeNone. 
3. If you want to custom it, just change to code of TopWarningView class. And don't worry about the iconIgv property, a nil image is acceptable, the layout will adjust to middle alignment;


### Finally

Demo sceenShot

![anyStr1](/screenShots/screenShot1.png "demo")
