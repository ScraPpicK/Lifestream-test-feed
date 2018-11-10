//
//  Post.m
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import "Post.h"

@interface Post ()

@property (readwrite)   NSString    *text;
@property (readwrite)   NSString    *publishDate;

@end

@implementation Post

- (instancetype)initWithText:(NSString *)text publishDate:(NSString *)publishDate {
    self = [super init];
    
    if (self) {
        self.text = text;
        self.publishDate = publishDate;
    }
    
    return self;
}

@end
