//
//  ViewController.m
//  UIWebViewSpeedDemo
//
//  Created by LKLFS on 16/1/5.
//  Copyright © 2016年 LKLFS. All rights reserved.
//

#import "ViewController.h"
#import "UIWebViewController.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (strong, nonatomic) UIWebView *webview;
@property (strong, nonatomic) WKWebView *wkWebview;
@end

@implementation ViewController
{
    UITextField * _textField;
    UIWebViewController * _wb;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    _wb = [[UIWebViewController alloc]init];

}

- (void)createUI
{
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 80, SCREENWIDTH - 20, 40)];
    _textField.layer.borderColor=[[UIColor blueColor]CGColor];
    _textField.layer.borderWidth= 1.0f;    
    [self.view addSubview:_textField];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 150, 140, 40)];
    btn.layer.borderColor = [[UIColor blueColor]CGColor];
    btn.layer.borderWidth = 1.0f;
    [btn setTitle:@"UIWebView加载" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onClickUIWebViewBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton * wkbtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREENWIDTH -170, 150, 140, 40)];
    wkbtn.layer.borderColor = [[UIColor blueColor]CGColor];
    wkbtn.layer.borderWidth = 1.0f;
    [wkbtn setTitle:@"WkWebView加载" forState:UIControlStateNormal];
    [wkbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [wkbtn addTarget:self action:@selector(onClickWKWebViewBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wkbtn];
}

- (void)onClickUIWebViewBtn
{
    [self loadUIWebViewWithURL:_textField.text];
    [self.navigationController pushViewController:_wb animated:YES];
}

- (void)onClickWKWebViewBtn
{
    [self loadWKWebViewWithURL:_textField.text];
    [self.navigationController pushViewController:_wb animated:YES];
}

- (void)loadUIWebViewWithURL:(NSString *)path
{
    if (_webview != nil) {
        [_webview removeFromSuperview];
        _webview = nil;
    }
    
    
    _webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [_wb.view addSubview:_webview];

    //NSString *pathtext = @"http://www.baidu.com";
    NSURL *url = [NSURL URLWithString:path];
    NSLog(@"-------");
    [_webview loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)loadWKWebViewWithURL:(NSString *)path
{
    if (_wkWebview != nil) {
        [_wkWebview removeFromSuperview];
        _wkWebview = nil;
    }

    _wkWebview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [_wb.view addSubview:_wkWebview];
    
    //NSString *pathtext = @"http://www.baidu.com";
    NSURL *url = [NSURL URLWithString:path];
    NSLog(@"-------");
    [_wkWebview loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_textField endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
