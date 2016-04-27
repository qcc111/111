//
//  ViewController.m
//  webViewAnimation
//
//  Created by lanouhn on 16/4/14.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate, UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://item.taobao.com/item.htm?id=529559692459"]];
    [self.webView loadRequest:request];
    self.scrollView.delegate = self;
    self.webView.scrollView.delegate = self;
    self.webView.scrollView.scrollEnabled = NO;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        if (scrollView.contentOffset.y >= 100) {
            self.webView.scrollView.scrollEnabled = YES;
            self.scrollView.scrollEnabled = NO;
            [self.webView.scrollView setContentOffset:CGPointMake(0, 0.01)];
        }
    }
    if (scrollView == self.webView.scrollView) {
        if (scrollView.contentOffset.y <= 0) {
            self.webView.scrollView.scrollEnabled = NO;
            self.scrollView.scrollEnabled = YES;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
