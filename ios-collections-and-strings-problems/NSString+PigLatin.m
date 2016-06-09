//
//  NSString+PigLatin.m
//  ios-collections-and-strings-problems
//
//  Created by Matt Amerige on 6/9/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)


/**
 English is translated to Pig Latin by taking the first letter of every word, moving it to the end of the word and adding ‘ay’
 */
- (NSString *)stringByTranslatingToPigLatin
{
    NSArray *words = [self componentsSeparatedByString:@" "];
    
    NSMutableString *resultString = [[NSMutableString alloc] init];
    
    for (NSString *word in words) {
        NSString *pigLatinWord = [self _translateWordToPigLatin:word];
        [resultString appendFormat:@"%@ ", pigLatinWord];
    }
    
    // Capitalize the first letter
    [self _capitalizeFirstLetterInSentence:resultString];
    
    NSString *final = [self _stringByTrimmingWhiteSpaceInString:resultString];
    
    return final;
}

- (NSString *)stringByTranslatingToEnglish
{
    // stub
    NSArray *words = [self componentsSeparatedByString:@" "];
    
    NSMutableString *resultString = [[NSMutableString alloc] init];
    
    for (NSString *word in words) {
        NSString *englishWord = [self _translateWordToEnglish:word];
        [resultString appendFormat:@"%@ ", englishWord];
    }
    
    // Capitalize the first letter
    [self _capitalizeFirstLetterInSentence:resultString];
    
    NSString *final = [self _stringByTrimmingWhiteSpaceInString:resultString];

    return final;
}

- (NSString *)_translateWordToPigLatin:(NSString *)word
{
    // Remove Punctuation
    
    word = [[word componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
    
    NSString *lowercaseWord = word.lowercaseString;
    
    // remove the first letter
    NSString *firstLetter = [lowercaseWord substringWithRange:NSMakeRange(0, 1)];
    NSString *base = [word stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
    
    // append "ay" to the end
    NSString *end = [firstLetter stringByAppendingString:@"ay"];
    
    // append the "ay" string to the base
    NSString *result = [base stringByAppendingString:end];
    
    return result;
}

- (NSString *)_translateWordToEnglish:(NSString *)word
{
    word = word.lowercaseString;
    
    // Grab the 3rd to last letter
    NSString *letterToMove = [word substringWithRange:NSMakeRange(word.length - 3, 1)];
    
    // drop the last three letter
    NSString *base = [word stringByReplacingCharactersInRange:NSMakeRange(word.length - 3, 3) withString:@""];
    
    // Combine the letter + base
    NSString *result = [NSString stringWithFormat:@"%@%@", letterToMove, base];
    
    return result;
}

- (void)_capitalizeFirstLetterInSentence:(NSMutableString *)sentence
{
    // Capitalize the first letter
    NSString *firstLetter = [sentence substringWithRange:NSMakeRange(0, 1)];
    firstLetter = firstLetter.uppercaseString;
    [sentence replaceCharactersInRange:NSMakeRange(0, 1) withString:firstLetter];
}

- (NSString *)_stringByTrimmingWhiteSpaceInString:(NSString *)string
{
    NSCharacterSet *whitespaceSet = [NSCharacterSet whitespaceCharacterSet];
    return [string stringByTrimmingCharactersInSet:whitespaceSet];
}

@end
