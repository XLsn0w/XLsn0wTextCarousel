//
//  ViewController.m
//  TaoBaoTopLine
//
//  Created by Yesi on 16/3/31.
//  Copyright © 2016年 Yesi. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "XLsn0wTextCarousel.h"

@interface ViewController () <TextInfoViewDelegate>
/** dataSource */
@property (nonatomic, strong) NSMutableArray *datas;


@end

@implementation ViewController
#pragma mark - Lazy 
-(NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
 
    [self createData];
    [self createToplineView];
    
   
}

// Create 10 datas
- (void)createData{
    
    for (int i = 0; i < 4; i++) {
      
        
        NSString *url;
        
        NSArray *titleArray = @[@"小巧便携/USB充电", @"人工智能将是微软的下一件", @"小米5s高配版拆解", @"海量新画面根本不是一个画风"];
        
        NSString *title = [titleArray objectAtIndex:i];
        
        if (i == 0) {
           url = @"0";
        }else if (i == 1) {
           url = @"1";
        }else if (i == 2) {
            url = @"2";
        }else {
            url = @"3";
        }
        DataModel *model = [DataModel dataModelWithTitle:title url:url type:url];
        
        [self.datas addObject:model];
    }
}
- (void)createToplineView{
    CGFloat width = 300;
    CGFloat height = 50;
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - width) / 2;
    CGFloat y = ([UIScreen mainScreen].bounds.size.height - height) / 2;

    XLsn0wTextCarousel *view = [[XLsn0wTextCarousel alloc] initWithFrame:CGRectMake(x , y, [UIScreen mainScreen].bounds.size.width-70, 80)];
    view.dataArr = self.datas;
    view.currentTextInfoView.xlsn0wDelegate = self;
    view.hiddenTextInfoView.xlsn0wDelegate = self;
    view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:view];
}

- (void)handleTopEventWithURLString:(NSString *)URLString {
    NSLog(@"URLString===%@", URLString);
}

- (void)handleBottomEventWithURLString:(NSString *)URLString {
    NSLog(@"URLString===%@", URLString);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
