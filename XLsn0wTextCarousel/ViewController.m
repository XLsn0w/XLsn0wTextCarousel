/*********************************************************************************************
 *   __      __   _         _________     _ _     _    _________   __         _         __   *
 *	 \ \    / /  | |        | _______|   | | \   | |  |  ______ |  \ \       / \       / /   *
 *	  \ \  / /   | |        | |          | |\ \  | |  | |     | |   \ \     / \ \     / /    *
 *     \ \/ /    | |        | |______    | | \ \ | |  | |     | |    \ \   / / \ \   / /     *
 *     /\/\/\    | |        |_______ |   | |  \ \| |  | |     | |     \ \ / /   \ \ / /      *
 *    / /  \ \   | |______   ______| |   | |   \ \ |  | |_____| |      \ \ /     \ \ /       *
 *   /_/    \_\  |________| |________|   |_|    \__|  |_________|       \_/       \_/        *
 *                                                                                           *
 *********************************************************************************************/

#import "ViewController.h"

#import "XLsn0wTextCarousel.h"
#import "DataSourceModel.h"

@interface ViewController () <TextInfoViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self createUI];
}

- (void)createUI{
    _dataSourceArray = [NSMutableArray array];
    NSArray *typeArray = @[@"最新", @"头条", @"推荐", @"热门"];
    NSArray *titleArray = @[@"小巧便携/USB充电", @"人工智能将是微软的下一件", @"小米5s高配版拆解", @"海量新画面根本不是一个画风"];
    NSArray *URLArray = @[@"http://0", @"http://1", @"http://2", @"http://3"];
    
    for (int i = 0; i < titleArray.count; i++) {
        NSString *title = [titleArray objectAtIndex:i];
        NSString *URLString = [URLArray objectAtIndex:i];
        NSString *type = [typeArray objectAtIndex:i];
        DataSourceModel *model = [DataSourceModel dataSourceModelWithType:type title:title URLString:URLString];
        [_dataSourceArray addObject:model];
    }
    XLsn0wTextCarousel *view = [[XLsn0wTextCarousel alloc] initWithFrame:CGRectMake(50 , 200, [UIScreen mainScreen].bounds.size.width-70, 80)];
    view.dataSourceArray = _dataSourceArray;
    view.currentTextInfoView.xlsn0wDelegate = self;
    view.hiddenTextInfoView.xlsn0wDelegate = self;
    view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:view];
}

- (void)handleTopEventWithURLString:(NSString *)URLString {
    NSLog(@"URLString===%@", URLString);
}

- (void)getTopDataSourceModel:(DataSourceModel *)topDataSourceModel {
    
    NSLog(@"第一个 %@ %@ %@", topDataSourceModel.type, topDataSourceModel.title, topDataSourceModel.URLString);
}

- (void)getBottomDataSourceModel:(DataSourceModel *)bottomDataSourceModel {
    NSLog(@"第二个 %@ %@ %@", bottomDataSourceModel.type, bottomDataSourceModel.title, bottomDataSourceModel.URLString);
}

- (void)handleBottomEventWithURLString:(NSString *)URLString {
    NSLog(@"URLString===%@", URLString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
