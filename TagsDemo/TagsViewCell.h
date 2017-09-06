//
//  TagsViewCell.h
//  TagsDemo
//
//  Created by Administrator on 16/1/21.
//  Copyright © 2016年 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagsFrame.h"

#import "TagButton.h"


@protocol TagsDelegate <NSObject>

@required

- (void)tagsClicked:(TagButton *)tagsButton indexPath:(NSIndexPath *)indexPath;

@end


@interface TagsViewCell : UITableViewCell


@property (nonatomic,assign)id <TagsDelegate> delegate;

+ (id)cellWithTableView:(UITableView *)tableView;
- (void)setTagsFrame:(TagsFrame *)tagsFrame section:(NSInteger)section;


@end
