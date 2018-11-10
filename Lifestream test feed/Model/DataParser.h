//
//  DataParser.h
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface DataParser : NSObject

- (void)parseData:(NSData *)data withCompletionHandler:(void (^ __nullable)(BOOL success, NSArray<Post *> *posts))completion;

@end
