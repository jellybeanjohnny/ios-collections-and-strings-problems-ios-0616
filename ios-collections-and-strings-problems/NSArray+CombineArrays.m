//
//  NSArray+CombineArrays.m
//  ios-collections-and-strings-problems
//
//  Created by Matt Amerige on 6/9/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "NSArray+CombineArrays.h"

@implementation NSArray (CombineArrays)

/**
 Write a method that combines two lists by alternatingly taking elements,
 e. g. [a, b, c], [1, 2, 3] becomes [a, 1, b, 2, c, 3].
 
 What if the arrays are different sizes?
 
 1. Could create new mutable arrays from the input, then remove each as you build the combined array
 2.
 */
+ (NSArray *)arrayByCombiningArray:(NSArray *)firstArray withArray:(NSArray *)secondArray
{
    NSMutableArray *firstMutableArray = [[NSMutableArray alloc] initWithArray:firstArray];
    NSMutableArray *secondMutableArray = [[NSMutableArray alloc] initWithArray:secondArray];
    
    NSMutableArray *combinedArray = [[NSMutableArray alloc] init];
    
    // Making sure the count will always use the smaller array, to avoid out of bounds errors in the below loop
    NSUInteger count = 0;
    if (firstArray.count < secondArray.count) {
        count = firstArray.count;
    }
    else {
        count = secondArray.count;
    }
    
    for (NSUInteger index = 0; index < count; index++) {
        
        // Popping off the first element in the array, adding it to the combined array, then removing it from the original
        [combinedArray addObject:[firstMutableArray firstObject]];
        [firstMutableArray removeObjectAtIndex:0];
        
        [combinedArray addObject:[secondMutableArray firstObject]];
        [secondMutableArray removeObjectAtIndex:0];
    }
    
    if (firstMutableArray.count != 0) {
        [combinedArray addObjectsFromArray:firstMutableArray];
    }
    else if (secondMutableArray.count != 0) {
        [combinedArray addObjectsFromArray:secondMutableArray];
    }
    
    return combinedArray;
}

@end
