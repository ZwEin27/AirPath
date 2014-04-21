//
//  UserProfileSynTests.m
//  AirPath
//
//  Created by zwein on 14-4-21.
//  Copyright (c) 2014年 zwein. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserProfileSyn.h"
@interface UserProfileSynTests : XCTestCase


@end

@implementation UserProfileSynTests


UserProfileSyn *userProfileSyn;

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    userProfileSyn = [[UserProfileSyn alloc] init];
    
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testAddUser
{
    BOOL result = [userProfileSyn addUser:@"testname" password:@"testpwd"];
    XCTAssertTrue(result, @"");
    
}

@end
