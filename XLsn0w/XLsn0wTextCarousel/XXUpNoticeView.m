//
//  XXUpNoticeView.m
//  XXUpNoticeViewDemo
//
//  Created by 朱小亮 on 16/7/28.
//  Copyright © 2016年 zhusven. All rights reserved.
//

#import "XXUpNoticeView.h"

@interface XXUpNoticeView()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)UITableView *tableView;

@property (strong,nonatomic)NSTimer *timer;

@property (strong,nonatomic)NSMutableArray *items;

@property (strong,nonatomic)NSMutableArray *dataSource;

@end

@implementation XXUpNoticeView




- (void)awakeFromNib{
    [super awakeFromNib];
   
    [self need];
}

- (id)init{
    if (self == [super init]) {
        [self need];
    }
    return self;
}

- (NSMutableArray *)items{
    if (!_items) {
        _items = [[NSMutableArray alloc] initWithObjects:@"hello",@"world",@"zxl",@"大帅哥",@"哈哈哈哈😄",@"点赞的都是大帅哥",@"😄",nil];
    }
    return _items;
}

- (void)setDataSourceDelegate:(id<XXUpNoticeViewDataSourceDelegate>)dataSourceDelegate{
    _dataSourceDelegate = dataSourceDelegate;

    [self.items removeAllObjects];
    [self.items addObjectsFromArray:[self.dataSourceDelegate itemsOfXXUpNoticeView:self]];

    self.dataSource = [NSMutableArray arrayWithObjects:self.items[0],self.items[1], nil];
}

- (void)need{
   
    if (self.dataSourceDelegate&&[self.dataSourceDelegate itemsOfXXUpNoticeView:self]) {
        [self.items removeAllObjects];
        [self.items addObjectsFromArray:[self.dataSourceDelegate itemsOfXXUpNoticeView:self]];
    }
    
     self.dataSource = [NSMutableArray arrayWithObjects:self.items[0],self.items[1], nil];
    
    [[self tableView] setBackgroundColor:[UIColor clearColor]];
    [self timer];
}


- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollAD:) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)scrollAD:(id)sender{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];

    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateData) userInfo:nil repeats:NO];
 
}

- (void)updateData{
    id  obj = [self.dataSource lastObject];
    NSInteger index = [self.items indexOfObject:obj];
    id result;
    if (index==(self.items.count-1) ){
        result = [self.items firstObject];
    }else{
        result = [self.items objectAtIndex:index+1];
    }
    
    [self.dataSource removeObjectAtIndex:0];
    [self.dataSource addObject:result];
    
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath0 atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (UITableView *)tableView{
    if (!_tableView) {
        CGRect frame = self.frame ;
        frame.origin.x = 0;
        frame.origin.y = 0;
        _tableView = [[UITableView alloc] initWithFrame:frame style:0];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.pagingEnabled = YES;
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
    

    }
    return _tableView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.dataSourceDelegate) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
        }
        cell.textLabel.text=  [NSString stringWithFormat:@"%@",self.dataSource[indexPath.row]];
        cell.textLabel.textColor = [UIColor blueColor];
        cell.backgroundColor = [UIColor lightGrayColor];
        return cell;
    }
    UITableViewCell *cell = [self.dataSourceDelegate XXUpNoticeView:self tableView:(UITableView *)tableView cellForRowAtIndexPath:indexPath dataSource:self.dataSource];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.dataSourceDelegate&&[self.dataSourceDelegate respondsToSelector:@selector(XXUpNoticeView:didSelectRow:)]) {
        id  obj = [self.dataSource objectAtIndex:indexPath.row];
        NSInteger index = [self.items indexOfObject:obj];
        [self.dataSourceDelegate XXUpNoticeView:self didSelectRow:index];
    }
}

@end
