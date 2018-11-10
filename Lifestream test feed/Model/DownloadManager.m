//
//  DownloadManager.m
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import "DownloadManager.h"
#import "DataParser.h"

#define kApiUrl [NSURL URLWithString:@"http://api.new.livestream.com/accounts/volvooceanrace/events/leg5"]

@interface DownloadManager () <NSURLSessionDownloadDelegate>

@property (nonatomic)       NSURLSession                        *urlSession;

@end

@implementation DownloadManager

- (instancetype)initWithDelegate:(nonnull NSObject<DownloadManagerDelegate> *)delegate {
    self = [super init];
    
    if (self) {
        NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.urlSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];

        self.delegate = delegate;
    }
    
    return self;
}

- (void)getData {
    NSURLRequest *downloadDataRequest = [NSURLRequest requestWithURL:kApiUrl];
    NSURLSessionDownloadTask *downloadTask = [self.urlSession downloadTaskWithRequest:downloadDataRequest];
    
    [downloadTask resume];
}

- (void)dealloc {
    [self.urlSession invalidateAndCancel];
}

#pragma mark - NSURLSession download delegate

- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location {
    NSData *postsData = [NSData dataWithContentsOfURL:location];
    if ([self.delegate respondsToSelector:@selector(downloadManagerDidGetData:)]) {
        [self.delegate downloadManagerDidGetData:postsData];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (error && [self.delegate respondsToSelector:@selector(couldNotDownloadData)]) {
        [self.delegate couldNotDownloadData];
    }
    
    [self.urlSession finishTasksAndInvalidate];
}

@end
