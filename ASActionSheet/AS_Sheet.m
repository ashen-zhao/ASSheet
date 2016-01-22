//
//  AS_Sheet.m
//  ASActionSheet
//
//  Created by Ashen on 16/1/22.
//  Copyright © 2016年 Ashen<http://www.devashen.com>. All rights reserved.
//

#import "AS_Sheet.h"

@interface AS_Sheet() {
    CGSize size;
}
@property (nonatomic, strong) UIView *bgkView;
@end

@implementation AS_Sheet

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr {
    self = [super initWithFrame:frame];
    size = [UIScreen mainScreen].bounds.size;
    [self setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.5]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenSheet)];
    [self addGestureRecognizer:tap];
    [self makeBaseUIWithTitleArr:titleArr];
    
    return self;
}

- (void)makeBaseUIWithTitleArr:(NSArray *)titleArr{
   
    self.bgkView = [[UIView alloc] initWithFrame:CGRectMake(0, size.height, size.width, titleArr.count * 50 + 55)];
    _bgkView.backgroundColor = [UIColor colorWithRed:0xe9/255.0 green:0xe9/255.0 blue:0xe9/255.0 alpha:1.0];
    [self addSubview:_bgkView];

    CGFloat y = [self createBtnWithTitle:@"取消" origin_y: _bgkView.frame.size.height - 50 tag:-1 action:@selector(hiddenSheet)] - 55;
    for (int i = 0; i < titleArr.count; i++) {
        y = [self createBtnWithTitle:titleArr[i] origin_y:y tag:i action:@selector(click:)];
    }
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = _bgkView.frame;
        frame.origin.y -= frame.size.height;
        _bgkView.frame = frame;
    }];
   
}

- (CGFloat)createBtnWithTitle:(NSString *)title origin_y:(CGFloat)y tag:(NSInteger)tag action:(SEL)method {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, y, size.width, 50);
    btn.backgroundColor = [UIColor whiteColor];
    btn.tag = tag;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:method forControlEvents:UIControlEventTouchUpInside];
    [_bgkView addSubview:btn];
    return y -= tag == -1 ? 0 : 50.4;
}
- (void)hiddenSheet {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = _bgkView.frame;
        frame.origin.y += frame.size.height;
        _bgkView.frame = frame;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}

- (void)click:(UIButton *)btn {
    if (self.Click) {
        _Click(btn.tag);
    }
}

@end
