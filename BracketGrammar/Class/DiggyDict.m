//
//  DiggyDict.m
//  BracketGrammar
//
//  Created by luowenx on 2017/1/26.
//  Copyright © 2017年 xtkj_ios. All rights reserved.
//

#import "DiggyDict.h"

@interface DiggyDict () {
    NSMutableDictionary *_rootDictionary;
}
@end

@implementation DiggyDict

- (id) init {
    if ((self = [super init])) {
        _rootDictionary = [NSMutableDictionary dictionary];
    }
    
    return self;
    
}

- (NSString *) description {
    return [_rootDictionary description];
}

- (NSMutableDictionary *) innerDictionaryForSplitKey: (NSArray *) splitKey {
    NSMutableDictionary *interim = _rootDictionary;
    
    for (int i = 0; i < splitKey.count - 1; i++) {
        id key = [splitKey objectAtIndex: i];
        NSMutableDictionary *next = interim[key];
        if (next == nil) {
            next = [NSMutableDictionary dictionary];
            interim[key] = next;
        }
        interim = next;
    }
    
    return interim;
    
}

- (id) objectForKeyedSubscript: (id) key {
    if (![key respondsToSelector: @selector(componentsSeparatedByString:)]) {
        return nil;
    }
    
    // Use slashes rather than periods because we're not really doing KVC.
    NSArray *splitKey = [key componentsSeparatedByString: @"/"];
    
    NSMutableDictionary *dict = [self innerDictionaryForSplitKey: splitKey];
    id leafKey = [splitKey lastObject];
    id result = dict[leafKey];
    
    return result;
    
}

- (void) setObject: (id) thing  forKeyedSubscript: (id<NSCopying>) key {
    id idKey = (id) key;
    if (![idKey respondsToSelector: @selector(componentsSeparatedByString:)]) {
        return;
    }
    
    // Use slashes rather than periods since we're not really doing KVC
    NSArray *splitKey = [idKey componentsSeparatedByString: @"/"];
    
    NSMutableDictionary *dict = [self innerDictionaryForSplitKey: splitKey];
    id leafKey = [splitKey lastObject];
    
    [dict setObject: thing  forKey: leafKey];
    
}

@end
