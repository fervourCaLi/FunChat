//
//  HomeViewController.m
//  QingQuChat
//
//  Created by fervour on 16/5/21.
//  Copyright (c) 2016年 com.fervour. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signOut:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
