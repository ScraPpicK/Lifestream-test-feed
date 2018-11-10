//
//  Post.m
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import "StatusPost.h"

static NSString * const textKey =       @"text";
static NSString * const publishAtKey =  @"publish_at";

@interface StatusPost ()

@property (readwrite)   NSString    *text;
@property (readwrite)   NSString    *publishDate;

@end

@implementation StatusPost

+ (instancetype)postWithDictionary:(NSDictionary *)dictionary {
    NSString *text = dictionary[textKey];
    NSString *publishDate = dictionary[publishAtKey];
    
    StatusPost *post = [[StatusPost alloc] initWithText:text publishDate:publishDate];
    return post;
}

- (instancetype)initWithText:(NSString *)text publishDate:(NSString *)publishDate {
    self = [super init];
    
    if (self) {
        self.text = text;
        self.publishDate = publishDate;
        
        self.postType = PostTypeStatus;
    }
    
    return self;
}

@end
