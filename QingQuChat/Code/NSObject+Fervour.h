//
//  NSObject+Fervour.h
//  QingQuChat
//
//  Created by fervour on 16/5/20.
//  Copyright © 2016年 com.fervour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Fervour)

- (void)setObject:(id)object forKey:(NSString *)key;
- (id)objectForKey:(NSString *)key;

@end
