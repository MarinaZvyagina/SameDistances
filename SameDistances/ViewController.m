//
//  ViewController.m
//  SameDistances
//
//  Created by Марина Звягина on 24.04.17.
//  Copyright © 2017 Zvyagina Marina. All rights reserved.
//

#import "ViewController.h"
#define NUMBER 4

@import Masonry;


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    NSUInteger widthOfElement = 20;
    NSInteger distanceBetweenElements = 20;
    NSUInteger distanceFromTop = 50;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:button];
     button.backgroundColor = [UIColor greenColor];
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:button2];
    button2.backgroundColor = [UIColor greenColor];
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:button3];
    button3.backgroundColor = [UIColor greenColor];
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:button4];
    button4.backgroundColor = [UIColor greenColor];
    
    
    void (^makeConstraint)(MASConstraintMaker *, MASViewAttribute *, MASViewAttribute *) = ^(MASConstraintMaker *make, MASViewAttribute *leftViewAttribute, MASViewAttribute *rightViewAttribute) {
        make.top.equalTo(self.view.mas_top).with.offset(distanceFromTop);
        make.left.equalTo(leftViewAttribute).with.offset(distanceBetweenElements);
        make.right.equalTo(rightViewAttribute).with.offset(-distanceBetweenElements);
    };

    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        makeConstraint(make, self.view.mas_left, button2.mas_left);
        make.width.greaterThanOrEqualTo(@(widthOfElement)).with.priorityLow();
    }];

    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        makeConstraint(make, button.mas_right, button3.mas_left);
        make.width.equalTo(button.mas_width);
    }];

    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        makeConstraint(make, button2.mas_right, button4.mas_left);
        make.width.equalTo(button.mas_width);
    }];

    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        makeConstraint(make, button3.mas_right, self.view.mas_right);
        make.width.equalTo(button.mas_width);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
