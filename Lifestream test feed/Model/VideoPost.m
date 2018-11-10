//
//  VideoPost.m
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import "VideoPost.h"

@implementation VideoPost

+ (instancetype)postWithDictionary:(NSDictionary *)dictionary {
    VideoPost *post = [VideoPost new];
    
    return post;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.postType = PostTypeVideo;
    }
    
    return self;
}

@end
