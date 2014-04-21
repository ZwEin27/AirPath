//
//  FBMissingSymbols.m
//  AirPath
//
//  Created by zwein on 14-2-27.
//  Copyright (c) 2014年 zwein. All rights reserved.
//
// Using this to solve problem that shows like this
/*
 Undefined symbols for architecture armv7:
 "_FBTokenInformationTokenKey", referenced from:
 -[PFFacebookTokenCachingStrategy accessToken] in Parse(PFFacebookTokenCachingStrategy.o)
 -[PFFacebookTokenCachingStrategy setAccessToken:] in Parse(PFFacebookTokenCachingStrategy.o)
 "_FBTokenInformationExpirationDateKey", referenced from:
 -[PFFacebookTokenCachingStrategy cacheTokenInformation:] in     Parse(PFFacebookTokenCachingStrategy.o)
 -[PFFacebookTokenCachingStrategy expirationDate] in Parse(PFFacebookTokenCachingStrategy.o)
 -[PFFacebookTokenCachingStrategy setExpirationDate:] in Parse(PFFacebookTokenCachingStrategy.o)
 "_OBJC_METACLASS_$_FBSessionTokenCachingStrategy", referenced from:
 _OBJC_METACLASS_$_PFFacebookTokenCachingStrategy in Parse(PFFacebookTokenCachingStrategy.o)
 "_OBJC_CLASS_$_FBSessionTokenCachingStrategy", referenced from:
 _OBJC_CLASS_$_PFFacebookTokenCachingStrategy in Parse(PFFacebookTokenCachingStrategy.o)
 "_FBTokenInformationUserFBIDKey", referenced from:
 -[PFFacebookTokenCachingStrategy facebookId] in Parse(PFFacebookTokenCachingStrategy.o)
 -[PFFacebookTokenCachingStrategy setFacebookId:] in Parse(PFFacebookTokenCachingStrategy.o)
 "_OBJC_CLASS_$_FBRequest", referenced from:
 objc-class-ref in Parse(PFFacebookAuthenticationProvider.o)
 "_OBJC_CLASS_$_FBSession", referenced from:
 objc-class-ref in Parse(PFFacebookAuthenticationProvider.o)
 ld: symbol(s) not found for architecture armv7
 clang: error: linker command failed with exit code 1 (use -v to see invocation)
 
 */

//get this answer from
//http://stackoverflow.com/questions/15457136/parse-for-ios-errors-when-trying-to-run-the-app

NSString *FBTokenInformationExpirationDateKey = @"";
NSString *FBTokenInformationTokenKey = @"";
NSString *FBTokenInformationUserFBIDKey = @"";
@interface FBAppCall:NSObject
@end
@implementation FBAppCall
@end
@interface FBRequest:NSObject
@end
@implementation FBRequest
@end
@interface FBSession:NSObject
@end
@implementation FBSession
@end
@interface FBSessionTokenCaching:NSObject
@end
@implementation FBSessionTokenCaching
@end
@interface FBSessionTokenCachingStrategy:NSObject
@end
@implementation FBSessionTokenCachingStrategy
@end