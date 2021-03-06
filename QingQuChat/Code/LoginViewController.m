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
    
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(loginSuccess) name:@"LoginSuccess" object:nil];

}

- (void)setUsernameAndPassWord {
    if ([_userNameTextField.text rangeOfString:kHostName].location != NSNotFound) {
        [self setObject:_userNameTextField.text forKey:kUserName];
    } else {
        [self setObject:[NSString stringWithFormat:@"%@@%@",_userNameTextField.text,kHostName] forKey:kUserName];
    }
    
    [self setObject:_passWordTextField.text forKey:kPassWord];
}
- (IBAction)dfg:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)login:(id)sender {
    [self setUsernameAndPassWord];
    
    [_xmppManager login];
}

- (void)loginSuccess {
    [self performSegueWithIdentifier:@"HomeSegue" sender:nil];
}

- (IBAction)registerAcount:(id)sender {
    [self setUsernameAndPassWord];
}

@end
