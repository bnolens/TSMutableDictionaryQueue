//
//  TSMutableDictionaryQueue.h
//  True Story
//
//  Created by Benoit Nolens on 11/01/14.
//  Copyright (c) 2015 True Story. All rights reserved.
//

#import <Foundation/Foundation.h>

///Queue data object. But every item in the queue is stored with a unique hash key, with which it can be removed.
@interface TSMutableDictionaryQueue : NSObject

/**
 Dequeue the next element in front of the queue
 */
- (id) dequeue;

/**
 Add an object at the end of the queue.
 If an element exists in the queue with the same key, it will be overwritten. So make sure keys are unique.
 @param object The object that should be added to the queue. 
 @param key The unique hash key that will be associated with the object
 */
- (void) enqueueObject:(id)object withKey:(NSString *)key;

/**
 Remove the object in the queue associated with this key.
 @param key The key associated with the object you want to remove
 */
- (void) removeObjectWithKey:(NSString*)key;

/**
 Clear the entire queue
 */
- (void) clear;

@end