//
//  NSString+Pangu.m
//  Pangu.Objective-C
//
//  Created by Cee on 26/07/2015.
//  Copyright (c) 2015 Cee. All rights reserved.
//

#import "NSString+Pangu.h"

@implementation NSString (Pangu)

+ (NSString *)spacing:(NSString *)text
{
    NSString *CJK_STRING = @"([\\p{InHiragana}\\p{InKatakana}\\p{InBopomofo}\\p{InCJKCompatibilityIdeographs}\\p{InCJKUnifiedIdeographs}])";
    
    NSRegularExpression *cjk_ans_regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@%@", CJK_STRING, @"([a-z0-9`~@\\$%\\^&\\*\\-_\\+=\\|\\\\/])"]
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    
    NSRegularExpression *ans_cjk_regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@%@", @"([a-z0-9`~!\\$%\\^&\\*\\-_\\+=\\|\\\\;:,\\./\\?])", CJK_STRING]
                                                                                   options:NSRegularExpressionCaseInsensitive
                                                                                     error:nil];
    
    NSRegularExpression *cjk_quote_regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@%@", CJK_STRING, @"([\"'])"]
                                                                                     options:0
                                                                                       error:nil];
    
    NSRegularExpression *quote_cjk_regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@%@", @"([\"'])", CJK_STRING]
                                                                                     options:0
                                                                                       error:nil];
    
    NSRegularExpression *fix_quote_regex = [NSRegularExpression regularExpressionWithPattern:@"([\"'])(\\s*)(.+?)(\\s*)([\"'])" options:0 error:nil];
    
    NSRegularExpression *cjk_bracket_cjk_regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@%@%@",  CJK_STRING, @"([\\({\\[]+(.*?)[\\)}\\]]+)", CJK_STRING]
                                                                                           options:0
                                                                                             error:nil];
    
    NSRegularExpression *cjk_bracket_regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@%@", CJK_STRING, @"([\\(\\){}\\[\\]<>])"]
                                                                                       options:0
                                                                                         error:nil];
    
    NSRegularExpression *bracket_cjk_regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@%@", @"([\\(\\){}\\[\\]<>])", CJK_STRING]
                                                                                       options:0
                                                                                         error:nil];
    
    NSRegularExpression *fix_bracket_regex = [NSRegularExpression regularExpressionWithPattern:@"([(\\({\\[)]+)(\\s*)(.+?)(\\s*)([\\)}\\]]+)"
                                                                                      options:0
                                                                                        error:nil];
    
    NSRegularExpression *cjk_hash_regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@%@", CJK_STRING, @"(#(\\S+))"]
                                                                                        options:0
                                                                                          error:nil];
    
    NSRegularExpression *hash_cjk_regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@%@", @"((\\S+)#)", CJK_STRING]
                                                                                    options:0
                                                                                      error:nil];
    
    text = [cjk_quote_regex stringByReplacingMatchesInString:text
                                                   options:0
                                                     range:NSMakeRange(0, text.length)
                                              withTemplate:@"$1 $2"];
    
    text = [quote_cjk_regex stringByReplacingMatchesInString:text
                                                   options:0
                                                     range:NSMakeRange(0, text.length)
                                              withTemplate:@"$1 $2"];
    
    text = [fix_quote_regex stringByReplacingMatchesInString:text
                                                     options:0
                                                       range:NSMakeRange(0, text.length)
                                                withTemplate:@"$1$3$5"];
    
    // CJK and brackets
    NSString *oldText = text;
    NSString *newText = [cjk_bracket_cjk_regex stringByReplacingMatchesInString:text
                                                                        options:0
                                                                          range:NSMakeRange(0, text.length)
                                                                   withTemplate:@"$1 $2 $4"];
    text = newText;
    
    if ([oldText isEqualToString:newText]) {
        text = [cjk_bracket_regex stringByReplacingMatchesInString:text
                                                           options:0
                                                             range:NSMakeRange(0, text.length)
                                                      withTemplate:@"$1 $2"];
        text = [bracket_cjk_regex stringByReplacingMatchesInString:text
                                                           options:0
                                                             range:NSMakeRange(0, text.length)
                                                      withTemplate:@"$1 $2"];
    }
    
    text = [fix_bracket_regex stringByReplacingMatchesInString:text
                                                       options:0
                                                         range:NSMakeRange(0, text.length)
                                                  withTemplate:@"$1$3$5"];
    
    // CJK and hash
    text = [cjk_hash_regex stringByReplacingMatchesInString:text
                                                   options:0
                                                     range:NSMakeRange(0, text.length)
                                              withTemplate:@"$1 $2"];
    text = [hash_cjk_regex stringByReplacingMatchesInString:text
                                                   options:0
                                                     range:NSMakeRange(0, text.length)
                                              withTemplate:@"$1 $3"];
    
    // CJK and ANS
    text = [cjk_ans_regex stringByReplacingMatchesInString:text
                                                   options:0
                                                     range:NSMakeRange(0, text.length)
                                              withTemplate:@"$1 $2"];
    text = [ans_cjk_regex stringByReplacingMatchesInString:text
                                                   options:0
                                                     range:NSMakeRange(0, text.length)
                                              withTemplate:@"$1 $2"];
    
    return text;
}

@end
