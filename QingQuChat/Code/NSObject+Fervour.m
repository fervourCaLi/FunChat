//
//  NSObject+Fervour.m
//  QingQuChat
//
//  Created by 我的宝宝 on 16/5/20.
//  Copyright © 2016年 com.fervour. All rights reserved.
//

#import "NSObject+Fervour.h"

@implementation NSObject (Fervour)

- (void)setObject:(id)object forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
}

- (id)objectForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
@end
