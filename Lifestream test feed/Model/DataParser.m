//
//  DataParser.m
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import "DataParser.h"

static NSString * const feedKey =       @"feed";
static NSString * const dataKey =       @"data";
static NSString * const typeKey =       @"type";

static NSString * const statusTypeString = @"status";

@implementation DataParser

- (void)parseData:(NSData *)data withCompletionHandler:(void (^)(BOOL, NSArray<Post *> * __nullable))completion {
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray<NSDictionary *> *feed = dictionary[feedKey][dataKey];
    if (!feed) {
        completion(NO, nil);
    }
    
    NSArray<Post *> *posts = [self handleFeedData:feed];
    BOOL success = posts.count ? YES : NO;
    
    completion(success, posts);
}

- (NSArray<Post *> *)handleFeedData:(nonnull NSArray<NSDictionary *> *)feedData {
    NSMutableArray<Post *> *posts = [NSMutableArray new];
    @try {
        for (NSDictionary *data in feedData) {
            if (![data[typeKey] isEqualToString:statusTypeString]) {
                continue;
            }
            
            NSDictionary *postData = data[dataKey];
            
            Post *post = [Post postWithDictionary:postData];
            [posts addObject:post];
        }
    } @catch (NSException *exception) {
        return nil;
    }
    
    return posts;
}

@end
