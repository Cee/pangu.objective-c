//
//  UILabel+Pangu.m
//  Pangu.Objective-C
//
//  Created by Cee on 11/08/2015.
//  Copyright (c) 2015 Cee. All rights reserved.
//

#import "UILabel+Pangu.h"

@implementation UILabel (Pangu)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(setText:);
        SEL swizzledSelector = @selector(pg_setText:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)pg_setText:(NSString *)string
{
    if (string == nil) {
       string = @"";
    }
    [self pg_setText:[NSString spacing:string]];
}

@end
