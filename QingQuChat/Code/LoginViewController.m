//
//  ViewController.m
//  QingQuChat
//
//  Created by fervour on 16/5/15.
//  Copyright (c) 2016年 com.fervour. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;

@property (strong, nonatomic) XMPPManager *xmppManager;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _xmppManager = [XMPPManager share];
}

- (void)setUsernameAndPassWord {
    if ([_userNameTextField.text rangeOfString:kHostName].location != NSNotFound) {
        [self setObject:_userNameTextField.text forKey:kUserName];
    } else {
        [self setObject:[NSString stringWithFormat:@"%@@%@",_userNameTextField.text,kHostName] forKey:kUserName];
    }
    
    
    [self setObject:_passWordTextField.text forKey:kPassWord];
}

- (IBAction)login:(id)sender {
    [self setUsernameAndPassWord];
    
    [_xmppManager login];
}

- (IBAction)registerAcount:(id)sender {
    [self setUsernameAndPassWord];
    
}
@end
