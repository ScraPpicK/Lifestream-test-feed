//
//  Post.h
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PostType) {
    PostTypeStatus,
    PostTypeVideo,
};

@interface Post : NSObject

@property (nonatomic)  PostType postType;

+ (instancetype)postWithDictionary:(NSDictionary *)dictionary;

@end
