//
//  Post.h
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic, readonly, nonnull)    NSString    *text;
@property (nonatomic, readonly)             NSString    *publishDate;

- (instancetype)initWithText:(nonnull NSString *)text publishDate:(nullable NSString *)publishDate;

@end
