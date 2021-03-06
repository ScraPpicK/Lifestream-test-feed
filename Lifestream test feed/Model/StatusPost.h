//
//  Post.h
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface StatusPost : Post

@property (nonatomic, readonly, nonnull)    NSString    *text;
@property (nonatomic, readonly, nullable)   NSString    *publishDate;

+ (instancetype)new __attribute((unavailable));
- (instancetype)init __attribute((unavailable));
- (instancetype)initWithText:(nonnull NSString *)text publishDate:(nullable NSString *)publishDate;

@end
