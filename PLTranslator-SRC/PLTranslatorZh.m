//
//  PLTranslatorZh.m
//  PLTranslatorDemo
//
//  Created by xu xhan on 8/29/11.
//  Copyright 2011 ixhan.com. All rights reserved.
//

#import "PLTranslatorZh.h"
#import "PLTranslatorZhTables.h"

@implementation PLTranslatorZh

- (id)initWithMarsSupport:(BOOL)isSupportMars
{
    self = [super init];
    
    charListS = [[NSString alloc] initWithString:PLTranslatorZhTableSimplifed];
    charListT = [[NSString alloc] initWithString:PLTranslatorZhTableTraditional];
    if (isSupportMars) {
        charListMars = [[NSString alloc] initWithString:PLTranslatorZhTableMars];
    }
    
    return self;
}

- (id)init
{
    self = [self initWithMarsSupport:YES];    
//    NSLog(@"%lu,%lu,%lu",[charListS length],[charListT length],[charListMars length]);
    return self;
}

- (void)dealloc
{
    [charListS release];
    [charListT release];
    [charListMars release];
    [super dealloc];
}

- (NSString*)translateToSimplifed:(NSString*)text
{
    NSMutableString* result = [NSMutableString stringWithCapacity:text.length];
    for (int i = 0; i < text.length; i++) {
        NSString* curCharacter = [text substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [charListT rangeOfString:curCharacter];
        if (range.length == 0 && charListMars) {
            range = [charListMars rangeOfString:curCharacter];
        }
        
        if (range.length != 0) {
            [result appendString:[charListS substringWithRange:range]];
        }else{
            [result appendString:[text substringWithRange:NSMakeRange(i, 1)]];
        }
    }
    return result;
}

- (NSString*)translateToTraditional:(NSString*)text
{
    NSMutableString* result = [NSMutableString stringWithCapacity:text.length];
    for (int i = 0; i < text.length; i++) {
        NSString* curCharacter = [text substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [charListS rangeOfString:curCharacter];
        if (range.length == 0 && charListMars) {
            range = [charListMars rangeOfString:curCharacter];
        }
        
        if (range.length != 0) {
            [result appendString:[charListT substringWithRange:range]];
        }else{
            [result appendString:[text substringWithRange:NSMakeRange(i, 1)]];
        }
    }    
    return result;    
}

- (NSString*)translateToMars:(NSString*)text
{
    if (!charListMars) return text;
    NSMutableString* result = [NSMutableString stringWithCapacity:text.length];
    for (int i = 0; i < text.length; i++) {
        NSString* curCharacter = [text substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [charListS rangeOfString:curCharacter];
        if (range.length == 0 && 1) {
            range = [charListT rangeOfString:curCharacter];
        }
        
        if (range.length != 0) {
            [result appendString:[charListMars substringWithRange:range]];
        }else{
            [result appendString:[text substringWithRange:NSMakeRange(i, 1)]];
        }
    }    
    return result;    
}

@end
