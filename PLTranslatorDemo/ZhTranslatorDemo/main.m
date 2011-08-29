//
//  main.m
//  ZhTranslatorDemo
//
//  Created by xu xhan on 8/29/11.
//  Copyright 2011 xu han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLTranslatorZh.h"
int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");
    PLTranslatorZh* zh = [[PLTranslatorZh alloc] initWithMarsSupport:YES];
    NSLog(@"%@",[zh translateToTraditional:@"简体中国许多东西周杰伦"]);

    [pool drain];
    return 0;
}

