//
//  NegativeArray.m
//  BracketGrammar
//
//  Created by luowenx on 2017/1/26.
//  Copyright © 2017年 xtkj_ios. All rights reserved.
//

#import "NegativeArray.h"

@interface NegativeArray () {
    NSMutableArray *_backingstore;
}
@end

@implementation NegativeArray

- (id) init {
    if ((self = [super init])) {
        _backingstore = [NSMutableArray array];
    }
    return self;
}

- (NSString *) description {
    return [_backingstore description];
}

- (id) objectAtIndexedSubscript: (NSInteger) index {
    if (index < 0) index = _backingstore.count + index;
    
    return [_backingstore objectAtIndex: index];
    
}

- (void) setObject: (id) thing  atIndexedSubscript: (NSInteger) index {
    if (index < 0) index = _backingstore.count + index;
    
    // Mutable array only allows setting the first-empty-index, like
    // -insertObject:atIndex:.  Any past that throws a range exception.
    // So let's be different and fill in intervening spaces w/ [NSNull null]
    // If you want to see @NULL, dupe rdar://10892975
    
    NSInteger toAdd = index - _backingstore.count;;
    for (int i = 0; i < toAdd; i++) {
        [_backingstore addObject: [NSNull null]];
    }
    
    if (index >= _backingstore.count) {
        [_backingstore addObject: thing];
    } else {
        [_backingstore replaceObjectAtIndex: index  withObject: thing];
    }
    
}

@end
