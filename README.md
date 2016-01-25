#仿照微博、微信的弹出ActionSheet的一个简单工具类

![ASSheet](https://github.com/Ashen-Zhao/ASSheet/blob/master/ASActionSheet/result.gif)  

###使用说明  

<pre> <code> 
 AS_Sheet *a = [[AS_Sheet alloc] initWithFrame:self.view.bounds titleArr:@[@"从手机相册选择", @"拍照", @"小视频"]];
    __weak typeof(a) weakA = a;
    a.Click = ^(NSInteger clickIndex) {
        switch (clickIndex) {
            case 0:
                NSLog(@"相册选择");
                break;
            case 1:
                NSLog(@"拍照");
                break;
            case 2:
                NSLog(@"小视频");
                break;
            default:
                break;
        }
        [weakA hiddenSheet];
    };
    [self.navigationController.view addSubview:a]; 
</code></pre>

只所以添加到navigationController的view上面，是希望导航也被弹出的视图覆盖，不让导航可以操作
