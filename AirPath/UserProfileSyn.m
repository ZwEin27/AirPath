//
//  UserProfileSyn.m
//  AirPath
//
//  Created by zwein on 14-4-21.
//  Copyright (c) 2014年 zwein. All rights reserved.
//

#import "UserProfileSyn.h"

@implementation UserProfileSyn

- (BOOL) addUser:(NSString *) username password:(NSString *) password{
    BOOL result = FALSE;
    PFUser *user = [PFUser user];
	user.username = username;
	user.password = password;
    result = [user signUp];
    return result;
}


@end
