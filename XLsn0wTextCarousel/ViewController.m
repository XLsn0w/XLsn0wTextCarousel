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

@interface ViewController ()<XLsn0wTextCarouselDelegate>

@property (nonatomic, weak) XLsn0wHeadlineView *toutiaoView;

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
    
    [self testToutiaoView];

}

- (void)testToutiaoView {
    
    XLsn0wHeadlineView * toutiao = [[XLsn0wHeadlineView alloc] init];
    toutiao.bottomScrollView.frame = CGRectMake(100, 100, [[UIScreen mainScreen] bounds].size.width, 60);
    [self.view addSubview:toutiao];
    toutiao.backgroundColor = [UIColor redColor];
    self.toutiaoView = toutiao;
    
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
    
    self.toutiaoView.items = @[item1, item2];
    self.toutiaoView.didSelectItemAtIndex = ^(NSUInteger index) {
        NSLog(@"tap index: %ld", index);
    };
}


- (void)textCarousel:(XLsn0wTextCarousel *)textCarousel didSelectedIndex:(NSInteger)selectedIndex {
    NSLog(@"%ld",selectedIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
