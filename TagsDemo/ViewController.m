//
//  ViewController.m
//  TagsDemo
//
//  Created by Administrator on 16/1/21.
//  Copyright © 2016年 Administrator. All rights reserved.
//

#import "ViewController.h"
#import "TagsFrame.h"
#import "TagsViewCell.h"

// RGB颜色
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 随机色
#define RandomColor RGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,TagsDelegate>

@property (nonatomic, strong) UITableView *tagsTable;

@property (nonatomic, strong) NSArray *tagsArray;

@property (nonatomic, strong) NSMutableArray *tagsFrames;

@property (nonatomic, strong) NSArray *colorArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动态创建多个标签";
    
    _tagsTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tagsTable.dataSource = self;
    _tagsTable.delegate = self;
    _tagsTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tagsTable];


    _tagsArray = @[
        @[@"钢琴钢琴钢琴钢琴钢琴",@"吉他",@"电吉他",@"小提琴",@"架子鼓",@"口琴",@"贝斯",@"卡祖笛",@"古筝",@"翻弹",@"音乐",@"指弹",@"千本樱",@"民乐",@"初音MIKU",@"ANIMENZ",@"PENBEAT",@"木吉他",@"二胡",@"COVER",@"交响",@"权御天下",@"普通DISCO",@"OP",@"ILEM",@"原创",@"作业用BGM",@"串烧",@"东方",@"合奏",@"燃向",@"触手",@"试奏",@"ACG指弹",@"武士桑",@"触手猴",@"BGM",@"LAUNCHPAD"],
        @[@"数学",@"物理",@"英语",@"化学",@"地理",@"历史",@"生物"],
        @[@"全部",@"国人女声",@"中文翻唱",@"英文翻唱",@"古风",@"粤语",@"原创曲"],
        @[@"K",@"轻音少女",@"误解向",@"我们仍未知道那天所看见的花的名字",@"华语",@"黑岩射手",@"空之境界"],
        @[@"吐槽",@"东方",@"FATE",@"多素材",@"新人向",@"丧心病狂",@"童年"]

    ];
    
    _tagsFrames = [NSMutableArray array];
    _colorArray = @[RGBColor(241, 241, 241),RGBColor(124, 124, 124),RGBColor(150, 150, 150),RGBColor(200, 200, 200),RGBColor(111, 111, 111)];
    
    [_tagsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        
        TagsFrame *tagsFrame = [[TagsFrame alloc] init];
        tagsFrame.tagsMinPadding = 5;
        tagsFrame.tagsMargin = 20;
        tagsFrame.tagsLineSpacing = 10;
        tagsFrame.tagsArray = obj;
        
        [_tagsFrames addObject:tagsFrame];
    }];
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tagsFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TagsViewCell *cell = [TagsViewCell cellWithTableView:tableView];
    [cell setTagsFrame:self.tagsFrames[indexPath.row] section:indexPath.row];
    cell.delegate = self;
    cell.contentView.backgroundColor = _colorArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_tagsFrames[indexPath.row] tagsHeight];
}

#pragma mark TagsDelegate
- (void)tagsClicked:(TagButton *)tagsButton indexPath:(NSIndexPath *)indexPath
{
    if (tagsButton.isSelected)
    {
        [tagsButton setBackgroundColor:[UIColor whiteColor]];
    }

    else
    {
        [tagsButton setBackgroundColor:[UIColor orangeColor]];
    }
    tagsButton.selected = !tagsButton.selected;
}
@end
