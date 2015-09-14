//
//  TSMutableDictionaryQueue.m
//  True Story
//
//  Created by Benoit Nolens on 11/01/14.
//  Copyright (c) 2015 True Story. All rights reserved.
//

#import "TSMutableDictionaryQueue.h"

@interface TSMutableDictionaryQueue()

@property (strong, nonatomic) NSMutableArray *keys;
@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@implementation TSMutableDictionaryQueue

- (instancetype) init {
    
    if (self = [super init]) {
        self.keys = [NSMutableArray new];
        self.dictionary = [NSMutableDictionary new];
    }
    
    return self;
}

- (id) dequeue {
    
    if (self.keys.count == 0) { return nil; }
    
    NSString *headKey = [self.keys objectAtIndex:0];
    if (!headKey) { return nil; }
    id headObject = [self.dictionary objectForKey:headKey];
    if (headObject) {
        [self.dictionary removeObjectForKey:headKey];
        [self.keys removeObjectAtIndex:0];
    }
    
    return headObject;
}

- (void) enqueueObject:(id)object withKey:(NSString *)key {
    
    if (key && object) {
        
        // Only add the key to the keys array if it's not already there
        if (![self.keys containsObject:key]) {
            [self.keys addObject:key];
        }
        
        [self.dictionary setObject:object forKey:key];
    }
}

- (void) removeObjectWithKey:(NSString*)key {
    
    if (key) {
        [self.dictionary removeObjectForKey:key];
        [self.keys removeObject:key];
    }
}

- (void) clear {
    
    [self.keys removeAllObjects];
    [self.dictionary removeAllObjects];
}

@end
