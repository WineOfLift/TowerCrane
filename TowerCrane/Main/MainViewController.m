//
//  MainViewController.m
//  TowerCrane
//
//  Created by ZM on 2018/11/15.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "MainViewController.h"
#import "FirstPageViewController.h"
#import "ShopViewController.h"
#import "PublishViewController.h"
#import "TradeViewController.h"
#import "PersonalViewController.h"

@interface MainViewController ()<UINavigationControllerDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBackgroundColor:[UIColor  whiteColor]];
    
//    //换掉tabBar上线
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
    [self  dropShadowWithOffset];
//    [self dropShadowWithOffset:CGSizeMake(0, -0.5) radius:1 color:[UIColor grayColor] opacity:0.3];
    
    
    NSArray * titleArray = [NSArray arrayWithObjects:@"主页",@"商城",@"发布",@"交易", @"我的", nil];
    NSArray * defaultArray = [NSArray  arrayWithObjects:@"firstPage_tabbar.png",@"shop_tabbar.png",@"release_tabbar.png",@"trad_tabbar.png",@"person_tabbar.png", nil];
    NSArray * selectedArray = [NSArray  arrayWithObjects:@"firstPageSelected_tabbar.png",@"shopSelected_tabbar.png",@"release_tabbar.png",@"tradSelected_tabbar.png",@"personSelected_tabbar.png", nil];
    //主页
    FirstPageViewController * firstPageVC = [[FirstPageViewController  alloc]init];
    UINavigationController * firstPageNav = [[UINavigationController  alloc]initWithRootViewController:firstPageVC];
    firstPageNav.tabBarItem.title = @"主页";
    firstPageNav.delegate = self;
    //商城
    ShopViewController * shopVC = [[ShopViewController  alloc]init];
    UINavigationController * shopNav = [[UINavigationController  alloc]initWithRootViewController:shopVC];
    shopNav.tabBarItem.title = @"商城";
    shopNav.delegate = self;

    
    //发布
    PublishViewController * publishVC = [[PublishViewController  alloc]init];
    UINavigationController * publishNav = [[UINavigationController  alloc]initWithRootViewController:publishVC];
    publishNav.tabBarItem.title = @"发布";
    publishNav.delegate = self;

    
    
    
    //交易
    TradeViewController * tradeVC = [[TradeViewController  alloc]init];
    UINavigationController * tradeNav = [[UINavigationController  alloc]initWithRootViewController:tradeVC];
    tradeNav.tabBarItem.title = @"交易";
    tradeNav.delegate = self;

    
    //个人中心
    PersonalViewController * personalVC = [[PersonalViewController  alloc]init];
    UINavigationController * personalNav = [[UINavigationController  alloc]initWithRootViewController:personalVC];
    personalNav.tabBarItem.title = @"我的";
    personalNav.delegate = self;

    
    self.viewControllers = @[firstPageNav,shopNav,publishNav,tradeNav,personalNav];

    //未选中
    [[UITabBarItem  appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    //选中
    [[UITabBarItem  appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:64/255.0 green:154/255.0 blue:235/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateSelected];
    
    for (int i = 0; i < self.tabBar.items.count; i++) {
        UITabBarItem * item = self.tabBar.items[i];
        item = [item  initWithTitle:titleArray[i] image:[ [UIImage  imageNamed:defaultArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage  imageNamed:selectedArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        if (i == self.tabBar.items.count /2) {
            item = [item  initWithTitle:titleArray[i] image: [UIImage  new] selectedImage: [UIImage  new]];
        
        }
    }

    

}

//tabBar顶部加阴影
- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity {
    
    // Creating shadow path for better performance
 /*   CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.tabBar.bounds);
    self.tabBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);*/
//
    self.tabBar.layer.shadowColor = color.CGColor;
    self.tabBar.layer.shadowOffset = offset;
    self.tabBar.layer.shadowRadius = radius;
    self.tabBar.layer.shadowOpacity = opacity;
    
    // Default clipsToBounds is YES, will clip off the shadow, so we disable it.
    self.tabBar.clipsToBounds = NO;
}
-(void)dropShadowWithOffset
{
//    CGPathRef
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 100, 1);
    
}

#pragma mark -----UINavigationControllerDelegate代理方法------
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController.navigationController respondsToSelector:@selector(pushViewController:animated:)] && viewController) {
        
        if (navigationController.viewControllers.count > 1) {
            [self  hidenBar];
        }else
        {
            [self  showBar];
        }
    }else
    {
        [self  showBar];
    }
    
}
-(void)hidenBar{
    self.tabBar.hidden=YES;
}

-(void)showBar{
    self.tabBar.hidden=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
