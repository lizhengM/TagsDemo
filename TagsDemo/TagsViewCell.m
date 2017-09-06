//
//  TagsViewCell.m
//  TagsDemo
//
//  Created by Administrator on 16/1/21.
//  Copyright © 2016年 Administrator. All rights reserved.
//

#import "TagsViewCell.h"

@implementation TagsViewCell

+ (id)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"tags";
    TagsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[TagsViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (void)setTagsFrame:(TagsFrame *)tagsFrame section:(NSInteger)section
{
    for (NSInteger i=0; i<tagsFrame.tagsArray.count; i++)
    {
        TagButton *tagsBtn = [TagButton buttonWithType:UIButtonTypeCustom];
        [tagsBtn setTitle:tagsFrame.tagsArray[i] forState:UIControlStateNormal];
        [tagsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        tagsBtn.titleLabel.font = TagsTitleFont;
        tagsBtn.backgroundColor = [UIColor whiteColor];
        tagsBtn.layer.borderWidth = 1;
        tagsBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        tagsBtn.layer.cornerRadius = 4;
        tagsBtn.layer.masksToBounds = YES;
        tagsBtn.indexPath = [NSIndexPath indexPathForRow:i inSection:section];
        tagsBtn.frame = CGRectFromString(tagsFrame.tagsFrames[i]);
        [tagsBtn addTarget:self action:@selector(tagsButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:tagsBtn];
    }
}
- (void)tagsButtonClicked:(id)sender
{
    TagButton *tagBtn = (TagButton *)sender;
    if (self.delegate)
    {
        [self.delegate tagsClicked:tagBtn indexPath:tagBtn.indexPath];
    }
}
@end
