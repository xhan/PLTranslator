//
//  PLTranslatorZh.h
//  PLTranslatorDemo
//
//  Created by xu xhan on 8/29/11.
//  Copyright 2011 ixhan.com. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 A simple way to convert languages between zh-hans, zh-hant, and zh-mars(火星文) by using local tables 
 缺陷，对于非unicode的字符可能有问题
 */

@interface PLTranslatorZh : NSObject{ 
    NSString *charListS, *charListT, *charListMars;
}

/*
 * Disable zh-mars(火星文) will slightly improve performance
 */
- (id)initWithMarsSupport:(BOOL)isSupportMars;

/*
 the text should be formatted as one of (zh-hans, zh-hant, and zh-mars(火星文) languages) 
 */
- (NSString*)translateToSimplifed:(NSString*)text;
- (NSString*)translateToTraditional:(NSString*)text;
- (NSString*)translateToMars:(NSString*)text;
@end
