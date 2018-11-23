

//
//  LoginViewController.m
//  TowerCrane
//
//  Created by ZM on 2018/11/20.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPassWordViewController.h"
#define leftStart_X   25
#define ViewShow_Height  40
#define UnSelected_Color   [UIColor whiteColor]
#define Selected_Color   RGB(85, 174, 245)

@interface LoginViewController ()
{
    UIView * loginTitleView;//密码登录、快速登录
    UIView * loginAccountView;//显示账号UI
    UIView * loginMimaView;//显示密码UI
}
@property (nonatomic, strong) UIButton * mimaTypeButton;//密码登录
@property (nonatomic, strong) UIButton * quickTypeButton;//快速登录
@property (nonatomic, strong) UIButton * selectedTypeButton;//选择按钮

@property (nonatomic, strong) UITextField * accountTextField;//账号输入框
@property (nonatomic, strong) UITextField * mimaTextField; //密码输入框

@property (nonatomic, strong) UIButton * forgetPasswordBtn;//忘记密码
@property (nonatomic, strong) UIButton * registerButton;//注册


@end

@implementation LoginViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  whiteColor];
    
    //背景图片
    UIImageView * backImageView = [[UIImageView  alloc]initWithFrame:CGRectMake(0, 0, [UIScreen  mainScreen].bounds.size.width, [UIScreen  mainScreen].bounds.size.height)];
    backImageView.backgroundColor = RGB(166, 193, 246);
    backImageView.image = [UIImage  imageNamed:@""];
    [self.view  addSubview:backImageView];
    
    //icon图片
    UIImageView * iconImageView = [[UIImageView  alloc]initWithFrame:CGRectMake([UIScreen  mainScreen].bounds.size.width/2 - (leftStart_X *2), 80, 120, 120)];
    iconImageView.backgroundColor = [UIColor  whiteColor];
    iconImageView.image = [UIImage  imageNamed:@""];
    iconImageView.layer.masksToBounds = YES;
    iconImageView.layer.cornerRadius = 60;
    iconImageView.layer.borderColor = RGB(85, 174, 245).CGColor;
    iconImageView.layer.borderWidth = 1;
    [self.view  addSubview:iconImageView];
    //登录选择
    loginTitleView = [[UIView  alloc]initWithFrame:CGRectMake(leftStart_X, CGRectGetMaxY(iconImageView.frame) + 60, [UIScreen  mainScreen].bounds.size.width - (leftStart_X *2), ViewShow_Height)];
    loginTitleView.alpha = 0.2;
    loginTitleView.backgroundColor = [UIColor whiteColor];
    [self.view  addSubview:loginTitleView];
    
    _mimaTypeButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    _mimaTypeButton.frame = CGRectMake(loginTitleView.frame.origin.x, loginTitleView.frame.origin.y, loginTitleView.frame.size.width/2, loginTitleView.frame.size.height);
    [_mimaTypeButton  setTitle:@"密码登录" forState:UIControlStateNormal];
    [_mimaTypeButton  setTitleColor:UnSelected_Color forState:UIControlStateNormal];
    _mimaTypeButton.titleLabel.font = [UIFont  systemFontOfSize:15];
    [_mimaTypeButton  addTarget:self action:@selector(mimaTypeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:_mimaTypeButton];
    
    _quickTypeButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    _quickTypeButton.frame = CGRectMake(CGRectGetMaxX(_mimaTypeButton.frame), loginTitleView.frame.origin.y, loginTitleView.frame.size.width/2, loginTitleView.frame.size.height);
    _quickTypeButton.backgroundColor = [UIColor  whiteColor];
    [_quickTypeButton  setTitle:@"快速登录" forState:UIControlStateNormal];
    [_quickTypeButton  setTitleColor:Selected_Color forState:UIControlStateNormal];
    _quickTypeButton.titleLabel.font = [UIFont  systemFontOfSize:15];
    [_quickTypeButton  addTarget:self action:@selector(quickTypeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:_quickTypeButton];
    self.selectedTypeButton = _quickTypeButton;
    //账号
    loginAccountView = [[UIView  alloc]initWithFrame:CGRectMake(leftStart_X, CGRectGetMaxY(loginTitleView.frame) + 35, [UIScreen  mainScreen].bounds.size.width - (leftStart_X *2), ViewShow_Height)];
    loginAccountView.alpha = 0.2;
    loginAccountView.backgroundColor = [UIColor whiteColor];
    [self.view  addSubview:loginAccountView];
    _accountTextField = [[UITextField  alloc]initWithFrame:CGRectMake(loginAccountView.frame.origin.x, loginAccountView.frame.origin.y, loginAccountView.frame.size.width, loginAccountView.frame.size.height)];
    UIImageView * leftImageView = [[UIImageView  alloc]initWithFrame:CGRectMake(0, 10, 30, 30)];
    leftImageView.backgroundColor = [UIColor  greenColor];
    _accountTextField.leftView = leftImageView;
    _accountTextField.placeholder = @"请输入手机号码";
    [self.view addSubview:_accountTextField];
    //密码或验证码
    loginMimaView = [[UIView  alloc]initWithFrame:CGRectMake(leftStart_X, CGRectGetMaxY(loginAccountView.frame) + 20, [UIScreen  mainScreen].bounds.size.width - (leftStart_X *2), ViewShow_Height)];
    loginMimaView.alpha = 0.2;
    loginMimaView.backgroundColor = [UIColor whiteColor];
    [self.view  addSubview:loginMimaView];
    
    //进入忘记密码页面
    _forgetPasswordBtn = [UIButton  buttonWithType:UIButtonTypeCustom];
    _forgetPasswordBtn.frame = CGRectMake(25, CGRectGetMaxY(loginMimaView.frame) + 5, 120, 35);
    [_forgetPasswordBtn  setTitle:@"忘记密码?" forState:UIControlStateNormal];
    _forgetPasswordBtn.titleLabel.font = [UIFont  systemFontOfSize:13];
    //文字据左
    _forgetPasswordBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_forgetPasswordBtn  setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    [_forgetPasswordBtn  addTarget:self action:@selector(forgetPasswordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:self.forgetPasswordBtn];

    //进入注册界面
    _registerButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    _registerButton.frame = CGRectMake([UIScreen  mainScreen].bounds.size.width - 145, CGRectGetMaxY(loginMimaView.frame) + 5, 120, 35);
    [_registerButton  setTitle:@"去注册" forState:UIControlStateNormal];
    _registerButton.titleLabel.font = [UIFont  systemFontOfSize:13];
    //文字据右
    _registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_registerButton  setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    
    [_registerButton  addTarget:self action:@selector(registerButtonBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:self.registerButton];
    
    UIButton * loginButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(25, CGRectGetMaxY(_forgetPasswordBtn.frame) + 40, [UIScreen  mainScreen].bounds.size.width - 50, 35);
    loginButton.backgroundColor = [UIColor  whiteColor];
    [loginButton  setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton  setTitleColor:RGB(85, 174, 245) forState:UIControlStateNormal];
    [loginButton  addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:loginButton];
    
    //登录下方的支付宝登录和微信登录
    UIImageView * lineImageView = [[UIImageView  alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(loginButton.frame) + 50, (SCREEN_WIDTH - 120)/2, 1)];
    lineImageView.backgroundColor = [UIColor whiteColor];
    lineImageView.alpha = 0.5;
    [self.view  addSubview:lineImageView];
    
    //支付宝登录
    UIButton * ailpayLoginButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    ailpayLoginButton.frame = CGRectMake(CGRectGetMaxX(lineImageView.frame), CGRectGetMaxY(lineImageView.frame) - 20, 40, 40);
    [ailpayLoginButton setImage:[UIImage  imageNamed:@""] forState:UIControlStateNormal];
    ailpayLoginButton.backgroundColor = [UIColor  greenColor];
    [ailpayLoginButton  addTarget:self action:@selector(ailpayLoginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:ailpayLoginButton];
    //微信登录
    UIButton * weixinLoginButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    weixinLoginButton.frame = CGRectMake(CGRectGetMaxX(ailpayLoginButton.frame) + 40, CGRectGetMaxY(lineImageView.frame) - 20, 40, 40);
    [weixinLoginButton  setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    weixinLoginButton.backgroundColor = [UIColor  greenColor];
    [weixinLoginButton  addTarget:self action:@selector(weixinLoginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:weixinLoginButton];
    //右边的直线
    UIImageView * secondLineImageView = [[UIImageView  alloc]initWithFrame:CGRectMake(CGRectGetMaxX(weixinLoginButton.frame), CGRectGetMaxY(loginButton.frame) + 50, (SCREEN_WIDTH - 120)/2, 1)];
    secondLineImageView.backgroundColor = [UIColor whiteColor];
    secondLineImageView.alpha = 0.5;
    [self.view  addSubview:secondLineImageView];
    
    
    
}
#pragma mark ---登录按钮-----
-(void)loginButtonClick:(UIButton *)sender
{
    NSLog(@"登录按钮点击");
    [self.navigationController popViewControllerAnimated:YES];
}
//忘记密码
-(void)forgetPasswordBtnClick:(UIButton *)sender
{
    ForgetPassWordViewController * forgetPasswordVC = [[ForgetPassWordViewController alloc]init];
    [self.navigationController pushViewController:forgetPasswordVC animated:YES];
}
//注册
-(void)registerButtonBtnClick:(UIButton *)sender
{
    RegisterViewController * registerVC = [[RegisterViewController  alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
//密码登录类型选择
-(void)mimaTypeButtonClick:(UIButton *)sender
{
    [_quickTypeButton setTitleColor:UnSelected_Color forState:UIControlStateNormal];
    _quickTypeButton.backgroundColor = [UIColor  clearColor];
    [_mimaTypeButton setTitleColor:Selected_Color forState:UIControlStateNormal];
    _mimaTypeButton.backgroundColor = [UIColor  whiteColor];
}
//快速登录类型选择
-(void)quickTypeButtonClick:(UIButton *)sender
{
    [self.mimaTypeButton setTitleColor:UnSelected_Color forState:UIControlStateNormal];
    self.mimaTypeButton.backgroundColor = [UIColor  clearColor];
    [_quickTypeButton setTitleColor:Selected_Color forState:UIControlStateNormal];
    _quickTypeButton.backgroundColor = [UIColor  whiteColor];
}
//支付宝登录的按钮
-(void)ailpayLoginButtonClick:(UIButton *)sender
{
    
}
//微信登录的按钮
-(void)weixinLoginButtonClick:(UIButton *)sender
{
    
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
