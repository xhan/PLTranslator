//
//  PLTranslator.h
//  PLTranslatorDemo
//
//  Created by xhan on 10-10-11.
//  Copyright 2010 ixhan.com. All rights reserved.
//

/*
 origin documents available on http://code.google.com/apis/ajaxlanguage/documentation/#fonje
 */

#import <Foundation/Foundation.h>

typedef const NSString* PLLangCode;

// language code :  http://en.wikipedia.org/wiki/IETF_language_tag

extern PLLangCode PLLangChineseSimplified;
extern PLLangCode PLLangChineseTradition;
extern PLLangCode PLLangEnglish;
extern PLLangCode PLLangJapanese;


@interface PLTranslator : NSObject {
	
}

/*
 set fromLang to nil will cause service to detect source during translation. 
 */
+ (NSURL*)URLforText:(NSString*)text fromLang:(PLLangCode)fromLang toLang:(PLLangCode)toLang;


#define kPLT_ERROR_DETAILS @"kPLT_DETAILS"
#define kPLT_STATUS @"kPLT_STATUS"
#define kPLT_TranslatedText @"kPLT_TranslatedText"
#define kPLT_DetectedSourceLanguage @"kPLT_DetectedSourceLanguage"

/*
 @return a Dictionary contains structure like this:
 kPLT_ERROR_DETAILS				->		only have contents when error occures
 kPLT_STATUS					->		200->success , 400 -> failed (nsnumber value)
 kPLT_TranslatedText			->		translated text
 kPLT_DetectedSourceLanguage	->		only have contents when 'from lang' is nil 
 */
+ (NSDictionary*)TranslationFromResponse:(NSString*)response;

+ (NSString*)TranslatedTextFromResponse:(NSString*)response;

@end
