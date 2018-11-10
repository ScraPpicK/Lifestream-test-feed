//
//  DownloadManager.h
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@protocol DownloadManagerDelegate <NSObject>

- (void)downloadManagerDidGetData:(NSArray<Post *> *)data;
- (void)couldNotDownloadData;
- (void)couldNotParseData;

@end

@interface DownloadManager : NSObject

+ (instancetype)new  __attribute((unavailable));
- (instancetype)init  __attribute((unavailable));
- (instancetype)initWithDelegate:(nonnull NSObject<DownloadManagerDelegate> *)delegate;

- (void)getData;

@end
