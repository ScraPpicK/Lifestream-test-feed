//
//  FeedTableViewCell.h
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "TableViewCellReusable.h"
#import "ViewNibName.h"

@interface FeedTableViewCell : UITableViewCell <TableViewCellReusable, ViewNibName>

- (void)setRepresentedObject:(Post *)representedObject;

@end
