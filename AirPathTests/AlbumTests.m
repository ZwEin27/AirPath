//
//  AlbumTests.m
//  AirPath
//
//  Created by zwein on 14-4-21.
//  Copyright (c) 2014年 zwein. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AlbumTests : XCTestCase

@end

@implementation AlbumTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testGetDefaultAssetsLibrary
{
    XCTAssertNotNil([AlbumUtility getDefaultAssetsLibrary], @"test");
    
}

@end
