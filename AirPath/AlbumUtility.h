//
//  AlbumUtility.h
//  AirPath
//
//  Created by zwein on 14-4-21.
//  Copyright (c) 2014年 zwein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface AlbumUtility : NSObject


+ (ALAssetsLibrary *) getDefaultAssetsLibrary;
+ (ALAssetsGroup *) createPhotoAlbum:(NSString *) albumName;
+ (ALAssetsGroup*) getAlbumByName:(NSString*) albumName;
+ (void) saveImageToNamedAlbum:(NSString *)albumName image:(CGImageRef)image metadata:(NSDictionary *)metadata;


@end
