//
//  ViewController.m
//  ASActionSheet
//
//  Created by Ashen on 16/1/22.
//  Copyright © 2016年 Ashen<http://www.devashen.com>. All rights reserved.
//

#import "ViewController.h"
#import "AS_Sheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSheet:(id)sender {
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
}


@end
