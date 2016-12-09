# UIWebView-JKLoadInfo
UIWebView-JKLoadInfo,a category for get UIWebView load progress,status and exact contentSize

##usage


```
#import "UIWebView+JKLoadInfo.h"
```

```
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.webView setJk_webViewLoadChangeBlock:^(UIWebView *webView, float progress,CGSize contentSize) {
        NSLog(@"progresss:%lf",progress);
        NSLog(@"contentSize:%@",NSStringFromCGSize(contentSize));
    }];
}
```

#更多Catgories

https://github.com/shaojiankui/JKCategories
