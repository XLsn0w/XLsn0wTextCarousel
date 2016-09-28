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
#import "XLsn0wHeadlineView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define kMidViewWidth   250
#define kMidViewHeight  50

#import "GBTopLineView.h"

@interface ViewController ()<XLsn0wTextCarouselDelegate, XLsn0wHeadlineViewDelegate>

@property (nonatomic, strong) XLsn0wHeadlineView *headlineView;

//@property(nonatomic,strong)NSMutableArray*dataArr;
//@property (nonatomic,strong) GBTopLineView *TopLineView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    XLsn0wTextCarousel *newsView = [[XLsn0wTextCarousel alloc]initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width, 20 )];
//    XLsn0wTextCarousel *newsView2 = [[XLsn0wTextCarousel alloc]initWithFrame:CGRectMake(50, 130, [UIScreen mainScreen].bounds.size.width, 20 )];
//    
//    newsView.noticeList = @[@"月牙泉再现罕见铁背鱼 已销声匿迹多年",@"中国警察首次巡逻罗马和米兰",@"台湾coser遭摄影师出卖 众多大尺度私照流出",@"韩最任性女主播曝私照 网友：皮卡丘都撑变形了",@"宋仲基与前女友大头贴曝光 你们给她的颜值打几分"];
//    
//       newsView2.noticeList = @[@"月牙泉再现罕见铁背鱼 已销声匿迹多年",@"中国警察首次巡逻罗马和米兰",@"台湾coser遭摄影师出卖 众多大尺度私照流出",@"韩最任性女主播曝私照 网友：皮卡丘都撑变形了",@"宋仲基与前女友大头贴曝光 你们给她的颜值打几分"];
//    newsView.duration = 2;
//    newsView2.duration = 2;
//    [self.view addSubview:newsView];
//    [self.view addSubview:newsView2];
//    newsView.xlsn0w_delegate = self;
//    [newsView startCarousel];
//    [newsView2 startCarousel];
    
    [self drawUI];

}

- (void)drawUI {
    self.headlineView = [[XLsn0wHeadlineView alloc] initWithFrame:CGRectMake(0, 100, 375, 80)];
    [self.view addSubview:self.headlineView];
    self.headlineView.xlsn0w_delegate = self;
    
    ItemObject * item1 = [ItemObject new];
    item1.title = @"最新";
    item1.detail = @"和谐社会，你懂的";
    item1.title1 = @"头条";
    item1.detail1 = @"友谊的小船，不能随便翻";
    
    ItemObject * item2 = [ItemObject new];
    item2.title = @"头条";
    item2.detail = @"时光已过永不回";
    item2.title1 = @"公告";
    item2.detail1 = @"往事只能回味";
    
    self.headlineView.items = @[item1, item2];
}

- (void)headlineView:(XLsn0wHeadlineView *)headlineView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld",index);
}

- (void)textCarousel:(XLsn0wTextCarousel *)textCarousel didSelectedIndex:(NSInteger)selectedIndex {
    NSLog(@"%ld",selectedIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)viewDidLoad {
//    [super viewDidLoad];
//    _dataArr=[[NSMutableArray alloc]init];
//    self.view.backgroundColor =[UIColor lightGrayColor];
//    [self createTopLineView];
//    [self getData];
//
//}
//#pragma mark-创建头条视图
//-(void)createTopLineView{
//    
//    _TopLineView = [[GBTopLineView alloc]initWithFrame:CGRectMake(0, 0, kMidViewWidth, kMidViewHeight)];
//    _TopLineView.center = CGPointMake(ScreenWidth/2.0, ScreenHeight/2.0-150);
//    _TopLineView.backgroundColor = [UIColor whiteColor];
//    __weak __typeof(self)weakSelf = self;
//    _TopLineView.clickBlock = ^(NSInteger index){
//        GBTopLineViewModel *model = weakSelf.dataArr[index];
//        NSLog(@"%@,%@",model.type,model.title);
//    };
//    [self.view addSubview:_TopLineView];
//    
//}
//#pragma mark-获取数据
//- (void)getData
//{
//    NSArray *arr1 = @[@"最新",@"最热",@"推荐",@"关注",@"反馈"];
//    NSArray *arr2 = @[@"66万硬币买车",@"泰坦尼克号重建",@"小德法网首胜纳达尔",@"欢迎大家来关注我的github主页",@"开发群qq：433060483"];
//    for (int i=0; i<arr2.count; i++) {
//        GBTopLineViewModel *model = [[GBTopLineViewModel alloc]init];
//        model.type = arr1[i];
//        model.title = arr2[i];
//        [_dataArr addObject:model];
//    }
//    [_TopLineView setVerticalShowDataArr:_dataArr];
//}


@end
