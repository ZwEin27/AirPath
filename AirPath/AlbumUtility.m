//
//  AlbumUtility.m
//  AirPath
//
//  Created by zwein on 14-4-21.
//  Copyright (c) 2014年 zwein. All rights reserved.
//

#import "AlbumUtility.h"


@implementation AlbumUtility

static ALAssetsLibrary *library = nil;

+(ALAssetsLibrary *)getDefaultAssetsLibrary{
    static dispatch_once_t pred = 0;
    if (library == nil) {
        dispatch_once(&pred, ^{
            library = [[ALAssetsLibrary alloc] init];
        });
    }
    return library;
}


+(ALAssetsGroup*) getAlbumByName:(NSString*) albumName
{
    static  ALAssetsGroup *group;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        
        
        
        dispatch_async(dispatch_queue_create("enum assets queue", nil), ^{
            
            [[AlbumUtility getDefaultAssetsLibrary] enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *g, BOOL *stop) {
                if (g==nil) {
                    dispatch_semaphore_signal(semaphore);
                }
                
                NSString *groupName = [g valueForProperty:ALAssetsGroupPropertyName];
                if([groupName isEqualToString:albumName]) {
                    group = g;
                    *stop = YES;
                    dispatch_semaphore_signal(semaphore);
                }
                
                
            } failureBlock:^(NSError* err){
                dispatch_semaphore_signal(semaphore);
                NSLog(@"enumerate ALAssetsLibrary fail :%@",err);
            }];
        });
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        if (group == nil) {
            dispatch_async(dispatch_queue_create("add assets queue", nil), ^{
                [[AlbumUtility getDefaultAssetsLibrary] addAssetsGroupAlbumWithName:albumName resultBlock:^(ALAssetsGroup *g){
                    group = g;
                    dispatch_semaphore_signal(semaphore);
                } failureBlock:^(NSError *error) {
                    NSLog(@"addAssetsGroupAlbumWithName fail:%@",error);
                    dispatch_semaphore_signal(semaphore);
                }];
            });
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        }
    });
    return group;
}


+ (void) saveImageToNamedAlbum:(NSString *)albumName image:(CGImageRef)image metadata:(NSDictionary *)metadata{
    {
        dispatch_queue_t t = dispatch_queue_create("save queue", nil);
        dispatch_async(t, ^{
            ALAssetsGroup* group = [AlbumUtility getAlbumByName:albumName];
            assert(group);
            [[AlbumUtility getDefaultAssetsLibrary] writeImageToSavedPhotosAlbum:image metadata:metadata completionBlock:^(NSURL *assetURL, NSError *error) {
                if (nil == error && assetURL){
                    [[AlbumUtility getDefaultAssetsLibrary] assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                        BOOL b =  group.isEditable;
                        b = [group addAsset:asset];
                        
                    } failureBlock:^(NSError *error) {
                        NSLog(@"assetForURL:%@",error);
                    }];
                }
                if (error){
                    NSLog(@"writeImageToSavedPhotosAlbum:%@",error);
                }
            }];
            
        });
        
    }
}

+ (ALAssetsGroup*) createPhotoAlbum:(NSString *) albumName{
    
    __block ALAssetsGroup* groupToAddTo;
    [[AlbumUtility getDefaultAssetsLibrary] addAssetsGroupAlbumWithName:albumName
                                                      resultBlock:^(ALAssetsGroup *group) {
                                                          // NSLog(@"added album:%@", albumName);
                                                          groupToAddTo = group;
                                                          if (groupToAddTo.editable) {
                                                              //NSLog(@"Gourp is Editable");
                                                          }else{
                                                              //NSLog(@"Gourp is not Editable");
                                                          }
                                                      }
                                                     failureBlock:^(NSError *error) {
                                                         NSLog(@"error adding album");
                                                     }];
    
    
    return groupToAddTo;
}



@end
