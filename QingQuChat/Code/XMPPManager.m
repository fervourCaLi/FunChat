//
//  XMPPManager.m
//  QingQuChat
//
//  Created by 我的宝宝 on 16/5/20.
//  Copyright © 2016年 com.fervour. All rights reserved.
//



#import "XMPPManager.h"

@interface XMPPManager () <XMPPStreamDelegate>
{
    BOOL _isRegister;
}

@end

static XMPPManager *_share = nil;

@implementation XMPPManager

+ (instancetype)share {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _share = [[XMPPManager alloc] init];
    });
    
    return _share;
}

- (instancetype)init {
    if (self = [super init]) {
        [self setupStream];
    }
    return  self;
}

- (void)setupStream {
    _xmppStream = [[XMPPStream alloc] init];
    _xmppStream.hostName = kHostName;
    _xmppStream.hostPort = kHostPort;
    [_xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
}

- (void)login {
    [self connect];
}

- (void)registerAcount {
    _isRegister = YES;
    [self connect];
    
}

- (BOOL)connect {
    
    if (_xmppStream.isConnected) {
        [self disconnect];
    }
    
    if (!_xmppStream.isDisconnected) {
        return YES;
    }
    
    _userName = [self objectForKey:kUserName];
    _passWord = [self objectForKey:kPassWord];
    
    if (_userName == nil || _passWord == nil) {
        return NO;
    }
    
    [_xmppStream setMyJID:[XMPPJID jidWithString:_userName]];
    
    NSError *error = nil;
    if (![_xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error]) {
        UIAlertView *alertView = [[UIAlertView  alloc] initWithTitle:@"错误" message:@"连接错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        
        return NO;
    }
    
    return YES;
}

- (void)disconnect {
    [_xmppStream disconnect];
}

#pragma mark XMPP Delegate
- (void)xmppStream:(XMPPStream *)sender socketDidConnect:(GCDAsyncSocket *)socket {
    NSLog(@"xmppStream --> socketDidConnect");
}

- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error {
    NSLog(@"xmppStream --> xmppStreamDidDisconnect error:%@",error);
}

- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    NSLog(@"xmppStream --> xmppStreamDidConnect");
    
    NSError *error = nil;
    if (_isRegister) {
        if (![_xmppStream registerWithPassword:_passWord error:&error]) {
            NSLog(@"注册失败");
        }
    } else {
        if (![_xmppStream authenticateWithPassword:_passWord error:&error]) {
            NSLog(@"登录失败");
            
        }
    }
}

- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    NSLog(@"登录成功");
}

- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error {
    NSLog(@"登录失败");
}

- (void)xmppStreamDidRegister:(XMPPStream *)sender {
    NSLog(@"注册成功");
}

- (void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error {
    NSLog(@"注册失败");
}


























@end
