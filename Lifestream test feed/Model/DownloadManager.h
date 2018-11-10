//
//  DownloadManager.h
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import <Foundation/Foundation.h>

@protocol DownloadManagerDelegate <NSObject>

- (void)downloadManagerDidGetData:(NSData *)data;
- (void)couldNotDownloadData;

@end

@interface DownloadManager : NSObject

@property (nonatomic, weak) NSObject<DownloadManagerDelegate>   *delegate;

- (instancetype)initWithDelegate:(nonnull NSObject<DownloadManagerDelegate> *)delegate;

- (void)getData;

@end
