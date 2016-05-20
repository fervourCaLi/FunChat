//
//  RegisterViewController.m
//  QingQuChat
//
//  Created by fervour on 16/5/21.
//  Copyright (c) 2016年 com.fervour. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerSuccess) name:@"RegisterSuccess" object:nil];
}

- (void)setUsernameAndPassWord {
    if ([_userNameTextField.text rangeOfString:kHostName].location != NSNotFound) {
        [self setObject:_userNameTextField.text forKey:kUserName];
    } else {
        [self setObject:[NSString stringWithFormat:@"%@@%@",_userNameTextField.text,kHostName] forKey:kUserName];
    }
    
    [self setObject:_passWordTextField.text forKey:kPassWord];
}

- (IBAction)registerAcount:(id)sender {
    [self setUsernameAndPassWord];
    
    [[XMPPManager share] registerAcount];
}

- (void)registerSuccess {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
