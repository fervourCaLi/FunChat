//
//  XMPPManager.h
//  QingQuChat
//
//  Created by fervour on 16/5/20.
//  Copyright © 2016年 com.fervour. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XMPP.h>

#define kUserName @"UserName"
#define kPassWord @"PassWord"
#define kHostName @"127.0.0.1"
#define kHostPort 5222

@interface XMPPManager : NSObject

@property (nonatomic, strong)XMPPStream *xmppStream;

@property (nonatomic, strong)NSString *userName;
@property (nonatomic, strong)NSString *passWord;


+ (instancetype)share;

- (void)login;
- (void)registerAcount;
@end
