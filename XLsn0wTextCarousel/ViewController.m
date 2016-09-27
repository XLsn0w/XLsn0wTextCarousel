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

@interface ViewController ()<XLsn0wTextCarouselDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XLsn0wTextCarousel *newsView = [[XLsn0wTextCarousel alloc]initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width, 20 )];
    XLsn0wTextCarousel *newsView2 = [[XLsn0wTextCarousel alloc]initWithFrame:CGRectMake(50, 130, [UIScreen mainScreen].bounds.size.width, 20 )];
    
    newsView.noticeList = @[@"月牙泉再现罕见铁背鱼 已销声匿迹多年",@"中国警察首次巡逻罗马和米兰",@"台湾coser遭摄影师出卖 众多大尺度私照流出",@"韩最任性女主播曝私照 网友：皮卡丘都撑变形了",@"宋仲基与前女友大头贴曝光 你们给她的颜值打几分"];
    
       newsView2.noticeList = @[@"月牙泉再现罕见铁背鱼 已销声匿迹多年",@"中国警察首次巡逻罗马和米兰",@"台湾coser遭摄影师出卖 众多大尺度私照流出",@"韩最任性女主播曝私照 网友：皮卡丘都撑变形了",@"宋仲基与前女友大头贴曝光 你们给她的颜值打几分"];
    newsView.duration = 2;
    newsView2.duration = 2;
    [self.view addSubview:newsView];
    [self.view addSubview:newsView2];
    newsView.delegate = self;
    [newsView startCarousel];
    [newsView2 startCarousel];

}
- (void)NewsBanner:(XLsn0wTextCarousel *)newsBanner didSelectIndex:(NSInteger)selectIndex
{
    NSLog(@"%ld",selectIndex);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
