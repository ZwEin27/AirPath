//
//  AirPathTests.m
//  AirPathTests
//
//  Created by zwein on 14-4-20.
//  Copyright (c) 2014年 zwein. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AirPathTests : XCTestCase

@end

@implementation AirPathTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

- (void)testTrue {
    XCTAssert(1, @"Can not be zero");
}




@end
