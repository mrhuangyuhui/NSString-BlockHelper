//
//  NSString+zxHelper.m
//  NSStringHelper
//
//  Created by zx on 8/23/14.
//  Copyright (c) 2014 zxstudio. All rights reserved.
//

#import "NSString+BlockHelper.h"

@implementation NSString (BlockHelper)

- (NSString *(^)(NSString *))add {
    NSString *(^result)(NSString *) = ^(NSString *input){
        NSString *output = nil;
        if ([input isKindOfClass:[NSString class]]) {
            output = [self stringByAppendingString:input];
        }
        return output;
    };
    return result;
}

- (NSInteger (^)(NSString *))indexOf {
    NSInteger (^result)(NSString *) = ^(NSString *input){
        NSInteger output = NSNotFound;
        output = [self rangeOfString:input].location;
        return output;
    };
    return result;
}

- (NSString *(^)(NSString *, NSString *))replace {
    NSString *(^result)(NSString *, NSString *) = ^(NSString *targetString, NSString *withString) {
        NSMutableString *output = [NSMutableString stringWithString:self];
        [output replaceOccurrencesOfString:targetString withString:withString options:NSCaseInsensitiveSearch range:NSMakeRange(0, self.length)];
        return output;
    };
    return result;
}

@end