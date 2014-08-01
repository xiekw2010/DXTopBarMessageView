DXTopBarMessageView
===================

Sometimes we think the alert view is a little annoying when we alert again and again if there are some problems like the awful network.

Sometimes it will be more delightful if you show the message on the top of your viewController and then it dimiss automatically after a while.

If you have used instagram, maybe you will have a figure on that.

## This maybe is your solution 

A category base on UIViewController, easy to use and custom.

### How to use

1. Import "UIViewController+TopBarMessage.h" to your own viewController or the .pch file

2. In your viewController implementation, just use [self showTopMessage:@"Oops, some message appears"]

3. A more detail api is, which can custom the top bar display, and recieve the tap gesture response on the topBar.

			/**
			 *  show the message with config the top bar
			 *
			 *  @param message    the text to show
			 *  @param config     the top bar view config, the whole version will be @{kDXTopBarBackgroundColor:[UIColor blueColor], kDXTopBarTextColor : [UIColor yellowColor], kDXTopBarIcon : [UIImage imageNamed:@"icon.png"], kDXTopBarTextFont : [UIFont boldSystemFontOfSize:15.0]}
			 *  @param delay      time to dismiss
			 *  @param tapHandler the tap handler
			 */
			- (void)showTopMessage:(NSString *)message topBarConfig:(NSDictionary *)config dismissDelay:(float)delay withTapBlock:(dispatch_block_t)tapHandler;



### Maybe beyond your consideration

1. Support the device rotation, just use it.
2. Gesture swipe to up will dismiss the topbar animated.
2. In iOS7 it needs to change your viewController's property edgesForExtendedLayout to UIRectEdgeNone in the viewDidLoad, otherwise, the top will display on the top of the viewController not under the navigationbar.


### Finally

Demo sceenShot

![anyStr1](/screenShots/demo.gif "demo")
