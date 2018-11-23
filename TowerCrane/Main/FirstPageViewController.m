
//
//  FirstPageViewController.m
//  TowerCrane
//
//  Created by ZM on 2018/11/15.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "FirstPageViewController.h"

@interface FirstPageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * firstTableView;

@end

@implementation FirstPageViewController
-(void)viewWillAppear:(BOOL)animated
{
    //隐藏导航栏下方的线
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  whiteColor];
    //设置左边的定位按钮
    UIButton * leftBar = [UIButton  buttonWithType:UIButtonTypeCustom];
    [leftBar  setImage:[UIImage imageNamed:@"left_location.png"] forState:UIControlStateNormal];
    [leftBar  setTitle:@"杭州" forState:UIControlStateNormal];
    [leftBar  setTitleColor:[UIColor  colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
    leftBar.frame = CGRectMake(0, 0, 55, 55);
    [leftBar  addTarget:self action:@selector(leftLocationButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftLocationButton = [[UIBarButtonItem  alloc]initWithCustomView:leftBar];
    self.navigationItem.leftBarButtonItem = leftLocationButton;
    
    //右边的按钮
    UIButton * rightMessage = [UIButton  buttonWithType:UIButtonTypeCustom];
    [rightMessage  setImage:[UIImage imageNamed:@"right_message.png"] forState:UIControlStateNormal];
    rightMessage.frame = CGRectMake(0, 0, 55, 55);
    [rightMessage  addTarget:self action:@selector(rightMessageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightMessageButton = [[UIBarButtonItem  alloc]initWithCustomView:rightMessage];
    self.navigationItem.rightBarButtonItem = rightMessageButton;
    
    //加载tableView
    self.firstTableView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.firstTableView.delegate = self;
    self.firstTableView.dataSource = self;
    [self.view  addSubview: self.firstTableView];
    
}
#pragma mark---导航条上按钮响应方法----
-(void)leftLocationButtonClick:(UIButton *)sender
{
    NSLog(@"---选择城市按钮点击了");
}
-(void)rightMessageButtonClick:(UIButton *)sender
{
    NSLog(@"---进入消息界面的按钮");
}
#pragma mark----tableView的代理方法-----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //第一个区是轮播图
    switch (indexPath.section) {
        case 0:
            {
                //轮播图
                
            }
            break;
            
        default:
            break;
    }
    UITableViewCell * cell = [tableView  dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    return cell;
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
