//
//  ViewController.m
//  iOS-WebView-ContentHeight
//
//  Created by Jakey on 2016/11/25.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import "ViewController.h"
#import "NSString+JKUUID.h"
#import "UIWebView+JKLoadInfo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView.scrollView.delegate = self; //不是必须的 为了 hook scrollViewDidScroll
    
    [self.webView setJk_webViewLoadChangeBlock:^(UIWebView *webView, float progress,CGSize contentSize) {
        NSLog(@"jk progresss:%lf",progress);
        NSLog(@"jk contentSize:%@",NSStringFromCGSize(contentSize));
    }];
}



- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webViewDidStartLoad");
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    CGFloat offsetHeight= [[webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"]floatValue];
    NSLog(@"document.body.offsetHeight:%lf",offsetHeight);
    
    NSLog(@"\n======================================================\n");

    CGFloat contentSizeHeight=[webView.scrollView contentSize].height;
    NSLog(@"contentSizeHeight:%lf",contentSizeHeight);

    NSLog(@"\n======================================================\n");

    CGFloat webViewHeight = 0.0f;
    if ([webView.subviews count] > 0)
    {
        UIView *scrollerView = webView.subviews[0];
        if ([scrollerView.subviews count] > 0)
        {
            UIView *webDocView = scrollerView.subviews.lastObject;
            if ([webDocView isKindOfClass:[NSClassFromString(@"UIWebDocumentView") class]])
            {
                webViewHeight = webDocView.frame.size.height;//获取文档的高度
                NSLog(@"UIWebDocumentView Height:%lf",webViewHeight);
            }
        }
    }
    NSLog(@"\n======================================================\n");

}
- (IBAction)touched:(id)sender {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://m.fengniao.com/?v=%@",[NSString jk_UUID]]]]];

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll webViewHeight:%lf",scrollView.contentSize.height);

}
@end
