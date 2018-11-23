
//
//  PersonalViewController.m
//  TowerCrane
//
//  Created by ZM on 2018/11/15.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "PersonalViewController.h"
#import "LoginViewController.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor  whiteColor];
    
    UIButton * intoLoginButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    intoLoginButton.frame = CGRectMake(30, 300, [UIScreen  mainScreen].bounds.size.width - 60, 35);
    intoLoginButton.backgroundColor = [UIColor  greenColor];
    [intoLoginButton  setTitle:@"进入登录" forState:UIControlStateNormal];
    [intoLoginButton  setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    intoLoginButton.layer.masksToBounds = YES;
    intoLoginButton.layer.cornerRadius = 10;
    [intoLoginButton  addTarget:self action:@selector(intoLoginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:intoLoginButton];
}
#pragma mark ----进入登录界面 -----
-(void)intoLoginButtonClick:(UIButton *)sender
{
    LoginViewController * loginVC = [[LoginViewController  alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
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
