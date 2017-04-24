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

    NSUInteger widthOfElement = self.view.bounds.size.width/(NUMBER*4);   //1;//self.view.bounds.size.width/();//20;
    NSInteger distanceBetweenElements = self.view.bounds.size.width/(NUMBER*3);// 20;
    NSUInteger distanceFromTop = 50;
    MASViewAttribute * almostLeftAttribute = self.view.mas_left;
    MASViewAttribute * almostRightAttribute = self.view.mas_right;
    MASViewAttribute * leftAttribute;
    
    NSMutableArray<UIView *> *buttons = [NSMutableArray<UIView *> new];
    
    void (^makeConstraint)(MASConstraintMaker *, MASViewAttribute *) = ^(MASConstraintMaker *make, MASViewAttribute *leftViewAttribute) {
        make.top.equalTo(self.view.mas_top).with.offset(distanceFromTop);
        make.left.equalTo(leftViewAttribute).with.offset(distanceBetweenElements);
    };
    
    for (NSUInteger i=0; i< NUMBER; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        button.backgroundColor = [UIColor greenColor];
        [self.view addSubview:button];
        [buttons addObject:button];
        
        leftAttribute = i == 0 ? almostLeftAttribute : buttons[i-1].mas_right;
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            makeConstraint(make, leftAttribute);
            if (i==0)
                make.width.greaterThanOrEqualTo(@(widthOfElement)).with.priorityLow();
            else
                make.width.equalTo(buttons[0].mas_width);
            if (i == NUMBER-1)
                make.right.equalTo(almostRightAttribute).with.offset(-distanceBetweenElements);
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
