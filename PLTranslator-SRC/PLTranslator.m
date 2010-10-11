//
//  PLTranslator.m
//  PLTranslatorDemo
//
//  Created by xhan on 10-10-11.
//  Copyright 2010 ixhan.com. All rights reserved.
//

#import "PLTranslator.h"

PLLangCode PLLangChineseSimplified = @"zh-cn";
PLLangCode PLLangChineseTradition = @"zh-tw";
PLLangCode PLLangEnglish = @"en";
PLLangCode PLLangJapanese = @"ja";

@implementation PLTranslator

+ (NSURL*)URLforText:(NSString*)text fromLang:(PLLangCode)fromLang toLang:(PLLangCode)toLang;
{
	NSAssert(toLang != nil, @"target Language can't be nil!");
	NSString* from = fromLang == nil ? @"" : fromLang;
	NSString* basicURL = @"http://ajax.googleapis.com/ajax/services/language/translate";
	NSString* urlEncodedText = [text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	return [NSURL URLWithString:[NSString stringWithFormat:@"%@?v=1.0&q=%@&langpair=%@%7c%@",basicURL,urlEncodedText,from,toLang]];
}

+ (NSDictionary*)TranslationFromResponse:(NSString*)response
{
	
}

+ (NSString*)TranslatedTextFromResponse:(NSString*)response{
	
}

@end
