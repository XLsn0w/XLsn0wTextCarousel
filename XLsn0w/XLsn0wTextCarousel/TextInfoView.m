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

#import "TextInfoView.h"

#define kFit6PWidth  ([UIScreen mainScreen].bounds.size.width / 414)
#define kFit6PHeight ([UIScreen mainScreen].bounds.size.height / 736)

@interface TextInfoView ()

@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;

@property (nonatomic, strong) UIButton *topButton;
@property (nonatomic, strong) UIButton *bottomButton;

@end

@implementation TextInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self drawUI];
    }
    return self;
}

- (void)drawUI {
    self.topLabel = [UILabel new];
    [self addSubview:self.topLabel];
    [self.topLabel setFrame:(CGRectMake(10, 10, 35, 25))];
    self.topLabel.layer.borderWidth = 1;
    self.topLabel.layer.borderColor = [[UIColor orangeColor] CGColor];
    self.topLabel.textColor = [UIColor orangeColor];
    self.topLabel.layer.cornerRadius = 5;
    self.topLabel.layer.masksToBounds = YES;
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.font = [UIFont systemFontOfSize:13];
    
    self.bottomLabel = [UILabel new];
    [self addSubview:self.bottomLabel];
    [self.bottomLabel setFrame:(CGRectMake(10, 40, 35, 25))];
    self.bottomLabel.layer.borderWidth = 1;
    self.bottomLabel.layer.borderColor = [[UIColor blueColor] CGColor];
    self.bottomLabel.textColor = [UIColor blueColor];
    self.bottomLabel.layer.cornerRadius = 5;
    self.bottomLabel.layer.masksToBounds = YES;
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    self.bottomLabel.font = [UIFont systemFontOfSize:13];
    
    self.topButton = [UIButton new];
    [self addSubview:self.topButton];
    [self.topButton setFrame:(CGRectMake(58*kFit6PWidth, 13, 270*kFit6PWidth, 21))];
    [self.topButton addTarget:self action:@selector(topButtonEvent:) forControlEvents:(UIControlEventTouchUpInside)];
    self.topButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [self.topButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    
    self.bottomButton = [UIButton new];
    [self addSubview:self.bottomButton];
    [self.bottomButton setFrame:(CGRectMake(58*kFit6PWidth, 43, 270*kFit6PWidth, 21))];
    [self.bottomButton addTarget:self action:@selector(bottomButtonEvent:) forControlEvents:(UIControlEventTouchUpInside)];
    self.bottomButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [self.bottomButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
}

- (void)topButtonEvent:(UIButton *)topButton {
    [self.xlsn0wDelegate handleTopEventWithURLString:self.topModel.URLString];
}

- (void)bottomButtonEvent:(UIButton *)bottomButton {
    [self.xlsn0wDelegate handleBottomEventWithURLString:self.bottomModel.URLString];
}

- (void)setTopModel:(DataSourceModel *)topModel {
    _topModel = topModel;
    //  去掉\n
    NSString *title = [NSString stringWithFormat:@"%@", [topModel.title stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"]];
    [self.topButton setTitle:title forState:UIControlStateNormal];
    self.topLabel.text = topModel.type;
    
}

- (void)setBottomModel:(DataSourceModel *)bottomModel {
    _bottomModel = bottomModel;
    NSString *title = [NSString stringWithFormat:@"%@", [bottomModel.title stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"]];
    [self.bottomButton setTitle:title forState:UIControlStateNormal];
     self.bottomLabel.text = bottomModel.type;
    
}

@end
