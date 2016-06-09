//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "NSString+PigLatin.h"
#import "NSArray+CombineArrays.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSMutableArray *words = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < 10; i++) {
        if (i % 2 == 0) {
            [words addObject:@"LOOOOOOOONG"];
        }
        else {
            [words addObject:@"short"];
        }
    }
    
    [self drawStarFrameForWords:words];
    
    
//     Pig Latin
    
    NSString *sentence = @"Hi I'm a dog";
    
    NSString *pigLatinSentence = [sentence stringByTranslatingToPigLatin];
    
    NSLog(@"%@", pigLatinSentence);
    
    NSString *englishSentence = [pigLatinSentence stringByTranslatingToEnglish];
    
    NSLog(@"%@", englishSentence);
    
    
//     Combining Arrays
    NSArray *letters = @[@"A", @"B", @"C", @"D"];
    NSArray *numbers = @[@1, @2, @3];
    
    NSArray *combinedArray = [NSArray arrayByCombiningArray:letters withArray:numbers];
    
    NSLog(@"Combined array: %@", combinedArray);
    
    
    // Digits
    NSLog(@"%@", [self arrayOfDigitsForInteger:12045]);
    
    
    return YES;
}


#pragma mark - Rectangular Star Frame

/**
 takes a list of strings an prints them, one per line, in a rectangular frame. 
 For example the list ["Hello", "World", "in", "a", "frame"] gets printed as:
 
 *********
 * Hello *
 * World *
 * in    *
 * a     *
 * frame *
 *********
 
 */
- (void)drawStarFrameForWords:(NSArray *)words
{
    NSUInteger longest = [self _longestWordLengthFromWords:words];
    NSString *row = [self _starRowForWidth:longest + 4];
    
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendFormat:@"\n%@", row];

    for (NSString *word in words) {
        
        if (word.length != longest) {
            // Adjust the spaces
            NSUInteger spaces = longest - word.length;
            
            [result appendFormat:@"\n* %@%*s *", word, (int)spaces, ""];
        }
        else {
            [result appendFormat:@"\n* %@ *", word];
        }
    }
    
    [result appendFormat:@"\n%@", row];
    
    NSLog(@"%@", result);
}

/**
 Calculates the frame width based on the longest string in the input array
 This will be just big enough so that all words will fit
 */
- (NSUInteger)_longestWordLengthFromWords:(NSArray *)strings
{
    NSUInteger longestLength = 0;
    
    for (NSString *word in strings) {
        if (word.length > longestLength) {
            longestLength = word.length;
        }
    }
    return longestLength;
}

- (NSString *)_starRowForWidth:(NSUInteger)width
{
    NSMutableString *row = [[NSMutableString alloc] initWithCapacity:width];
    
    for (NSUInteger i = 0; i < width; i++) {
        [row appendString:@"*"];
    }
    return row;
}

#pragma mark - Digits
- (NSArray *)arrayOfDigitsForInteger:(NSUInteger)anInteger
{
    // Find the number of digits
    NSUInteger numberOfDigits = [self numberOfDigitsInInteger:anInteger];
    
    NSMutableArray *digits = [[NSMutableArray alloc] initWithCapacity:numberOfDigits];
    
    for (NSUInteger i = 0; i < numberOfDigits; i++) {
        
        NSUInteger nextDigit = anInteger % 10;
        [digits addObject:@(nextDigit)];
        
        anInteger /= 10;
    }
    
    // reverse the array
    return [self reverseArray:digits];
}

- (NSUInteger)numberOfDigitsInInteger:(NSUInteger)anInteger
{
    NSString *integerAsString = [NSString stringWithFormat:@"%ld", anInteger];
    
    return integerAsString.length;
}

- (NSArray *)reverseArray:(NSMutableArray *)array
{
    NSUInteger endIndex = array.count - 1;
    for (NSUInteger startIndex = 0; startIndex < array.count / 2; startIndex++) {
        NSNumber *start = array[startIndex];
        NSNumber *end = array[endIndex];
        array[startIndex] = end;
        array[endIndex] = start;
        endIndex--;
    }
    return array;
}

- (NSArray *)reverseArray2:(NSMutableArray *)array
{
    NSUInteger endIndex = array.count - 1;
    for (NSUInteger startIndex = 0; startIndex < array.count / 2; startIndex++) {
        [array exchangeObjectAtIndex:startIndex withObjectAtIndex:endIndex];
        endIndex--;
    }
    return array;
}


@end














