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
    [showBtn setTitle:@"show" forState:UIControlStateNormal];
    [showBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showTop) forControlEvents:UIControlEventTouchUpInside];
    showBtn.frame = CGRectMake(100, 50, 50, 44);
    showBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:showBtn];
}

- (void)showTop
{
    [self showTopMessage:self.textField.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
