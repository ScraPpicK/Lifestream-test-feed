//
//  FeedTableViewCell.m
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import "FeedTableViewCell.h"

@interface FeedTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *postTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishDateLabel;

@end

@implementation FeedTableViewCell

+ (NSString *)reusableIdentifier {
    return self.description;
}

+ (NSString *)nibName {
    return self.description;
}

- (void)setText:(NSString *)text publishDate:(NSString *)publishDate {
    self.postTextLabel.text = text;
    self.publishDateLabel.text = publishDate;
}

@end
