//
//  DXHomeViewController.m
//  DXTopBarMessageView
//
//  Created by xiekw on 14-3-17.
//  Copyright (c) 2014年 xiekw. All rights reserved.
//

#import "DXHomeViewController.h"
#import "UIViewController+TopBarMessage.h"

@interface DXHomeViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation DXHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
	// Do any additional setup after loading the view.
    self.title = @"TopBarMessage";
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    self.textField.text = @"Tap some text here to test";
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.textField becomeFirstResponder];
    [self.view addSubview:self.textField];
        
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [showBtn setTitle:@"Custom" forState:UIControlStateNormal];
    [showBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showCustom) forControlEvents:UIControlEventTouchUpInside];
    showBtn.frame = CGRectMake(40, 50, 100, 44);
    showBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:showBtn];
    
    UIButton *navButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [navButton setTitle:@"Default" forState:UIControlStateNormal];
    [navButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [navButton addTarget:self action:@selector(showDefault) forControlEvents:UIControlEventTouchUpInside];
    navButton.frame = CGRectMake(160, 50, 100, 44);
    navButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:navButton];

}

- (void)showDefault
{
    [self showTopMessage:self.textField.text];
}

- (void)showCustom
{
    
    NSDictionary *topBarConfig = @{kDXTopBarBackgroundColor:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8], kDXTopBarTextColor : [UIColor yellowColor], kDXTopBarIcon : [UIImage imageNamed:@"ico_error.png"], kDXTopBarTextFont : [UIFont boldSystemFontOfSize:15.0]};
    
    [self showTopMessage:self.textField.text topBarConfig:topBarConfig dismissDelay:10.0 withTapBlock:^{
        NSLog(@"i am tap now");
        [self.navigationController pushViewController:[DXHomeViewController new] animated:YES];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
