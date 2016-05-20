//
//  XMPPManager.h
//  QingQuChat
//
//  Created by 我的宝宝 on 16/5/20.
//  Copyright © 2016年 com.fervour. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XMPP.h>

#define kUserName @"UserName"
#define kPassWord @"PassWord"
#define kHostName @"bogon"
#define kHostPort 5280

@interface XMPPManager : NSObject

@property (nonatomic, strong)XMPPStream *xmppStream;

@property (nonatomic, strong)NSString *userName;
@property (nonatomic, strong)NSString *passWord;


+ (instancetype)share;

- (void)login;
- (void)registerAcount;
@end
