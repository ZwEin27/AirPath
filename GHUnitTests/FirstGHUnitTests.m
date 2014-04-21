//
//  FirstGHUnitTests.m
//  UnitTestDemo
//
//  Created by Jymn_Chen on 14-3-20.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>

@interface MyTest : GHTestCase

@end

@implementation MyTest



- (void)testSimpleFail {
    GHAssertTrue(NO, nil);
}


@end
