//
//  DiggyDict.h
//  BracketGrammar
//
//  Created by luowenx on 2017/1/26.
//  Copyright © 2017年 xtkj_ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiggyDict : NSObject

- (id) objectForKeyedSubscript: (id) key;
- (void) setObject: (id) thing  forKeyedSubscript: (id) key;

@end
