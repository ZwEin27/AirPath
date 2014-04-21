//
//  AlbumTests.m
//  AirPath
//
//  Created by zwein on 14-4-21.
//  Copyright (c) 2014年 zwein. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "AlbumUtility.h"
@interface AlbumTests : GHTestCase

@end


@implementation AlbumTests

- (void)testGetDefaultAssetsLibrary {
    GHAssertNotNil([AlbumUtility getDefaultAssetsLibrary], nil);
    
}


@end
