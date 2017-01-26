//
//  ViewController.m
//  BracketGrammar
//
//  Created by luowenx on 2017/1/26.
//  Copyright © 2017年 xtkj_ios. All rights reserved.
//

#import "ViewController.h"
#import "Class/Braccket.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self negativeArrayTest];
    [self diggyDictTest];
}

-(void) negativeArrayTest
{
    NegativeArray *negativeArray = [[NegativeArray alloc] init];
    negativeArray[0] = @(10);
    negativeArray[1] = @"123";
    negativeArray[5] = @"abc";
    
    NSLog(@"negativeArray: %@", negativeArray);
    NSLog(@"negativeArray[3]: %@", negativeArray[3]);

}

-(void)diggyDictTest
{
    DiggyDict *diggyDic = [[DiggyDict alloc] init];
    diggyDic[@"a"] = @"aaa";
    diggyDic[@"b"] = @"bbb";
    diggyDic[@"c/b/a"] = @"cba";

    
    NSLog(@"diggyDic: %@", diggyDic);
    NSLog(@"diggyDic[3]: %@", diggyDic[@"c/b/a"]);
}


@end
