//
//  FeedTableViewCell.h
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface FeedTableViewCell : UITableViewCell

+ (NSString *)reusableIdentifier;
+ (NSString *)nibName;

- (void)setRepresentedObject:(Post *)representedObject;

@end
