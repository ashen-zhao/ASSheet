//
//  AS_Sheet.h
//  ASActionSheet
//
//  Created by Ashen on 16/1/22.
//  Copyright © 2016年 Ashen<http://www.devashen.com>. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AS_Sheet : UIView

@property (nonatomic, copy) void (^Click)(NSInteger clickIndex);

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr;
- (void)hiddenSheet;

@end
