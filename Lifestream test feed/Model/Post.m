//
//  Post.m
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import "Post.h"

static NSString * const textKey =       @"text";
static NSString * const publishAtKey =  @"publish_at";

@interface Post ()

@property (readwrite)   NSString    *text;
@property (readwrite)   NSString    *publishDate;

@end

@implementation Post

+ (instancetype)postWithDictionary:(NSDictionary *)dictionary {
    NSString *text = dictionary[textKey];
    NSString *publishDate = dictionary[publishAtKey];
    
    Post *post = [[Post alloc] initWithText:text publishDate:publishDate];
    return post;
}

- (instancetype)initWithText:(NSString *)text publishDate:(NSString *)publishDate {
    self = [super init];
    
    if (self) {
        self.text = text;
        self.publishDate = publishDate;
    }
    
    return self;
}

@end
