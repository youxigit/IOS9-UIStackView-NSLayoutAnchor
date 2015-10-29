//
//  ViewController.m
//  TCStackDemon
//
//  Created by qingduan on 15/10/27.
//  Copyright © 2015年 qingduan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self horizontalStackViewInit];
    [self verticalStackViewInit];
    [self.view setNeedsUpdateConstraints];
}

- (void)horizontalStackViewInit
{
    _horizontalStackView = [[UIStackView alloc]init];
    _horizontalStackView.axis = UILayoutConstraintAxisHorizontal;
    _horizontalStackView.distribution = UIStackViewDistributionFillEqually;
    _horizontalStackView.alignment = UIStackViewAlignmentCenter;
    _horizontalStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_horizontalStackView];
}

- (void)verticalStackViewInit
{
    _tips = [[UILabel alloc]init];
    _tips.text = @"Do you like our app?";
    _tips.textAlignment = NSTextAlignmentCenter;
    
    _logoImageView = [[UIImageView alloc]init];
    _logoImageView.image = [UIImage imageNamed:@"logo"];
    
    _addSmileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addSmileBtn setTitle:@"Add Smile" forState:UIControlStateNormal];
    [_addSmileBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_addSmileBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_addSmileBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _removeSmile = [UIButton buttonWithType:UIButtonTypeCustom];
    [_removeSmile setTitle:@"Remove Smile" forState:UIControlStateNormal];
    [_removeSmile setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_removeSmile setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_removeSmile addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *btns = @[_addSmileBtn,_removeSmile];
    _btnStackView = [[UIStackView alloc]initWithArrangedSubviews:btns];
    _btnStackView.axis = UILayoutConstraintAxisHorizontal;
    _btnStackView.distribution = UIStackViewDistributionFillEqually;
    _btnStackView.alignment = UIStackViewAlignmentCenter;
    _btnStackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *subViews = @[_tips,_logoImageView,_btnStackView];
    _verticalStackView = [[UIStackView alloc]initWithArrangedSubviews:subViews];
    _verticalStackView.axis = UILayoutConstraintAxisVertical;
    _verticalStackView.distribution = UIStackViewDistributionFillEqually;
    _verticalStackView.alignment = UIStackViewAlignmentCenter;
    _verticalStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_verticalStackView];
}

- (void)updateViewConstraints
{
    
    //ios 9 中自动布局引入神器NSLayoutAnchor，代码瘦身效果非常显著
    [_verticalStackView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [_verticalStackView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [_verticalStackView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [_verticalStackView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.9].active = YES;
    
    [_horizontalStackView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [_horizontalStackView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [_horizontalStackView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [_horizontalStackView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.1].active = YES;
    
    [_logoImageView.widthAnchor constraintEqualToAnchor:_logoImageView.heightAnchor multiplier:1].active = YES;
    
   
    /*************IOS 9 之前的约束实现*******************/
    
//    [NSLayoutConstraint constraintWithItem:_logoImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_logoImageView attribute:NSLayoutAttributeHeight multiplier:1 constant:0].active = YES;
//    
//    [NSLayoutConstraint constraintWithItem:_verticalStackView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
//    [NSLayoutConstraint constraintWithItem:_verticalStackView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
//    [NSLayoutConstraint constraintWithItem:_verticalStackView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.9 constant:0].active = YES;
//    
//    [NSLayoutConstraint constraintWithItem:_horizontalStackView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
//    [NSLayoutConstraint constraintWithItem:_horizontalStackView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
//    [NSLayoutConstraint constraintWithItem:_horizontalStackView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
//    [NSLayoutConstraint constraintWithItem:_horizontalStackView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0].active = YES;
    
    [super updateViewConstraints];
}

- (void)buttonAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (btn == _addSmileBtn)
    {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"smile"]];
        image.contentMode = UIViewContentModeScaleAspectFit;
        [_horizontalStackView addArrangedSubview:image];
        [UIView animateWithDuration:0.25 animations:^{
            [_horizontalStackView layoutIfNeeded];
        }];
        
    }else
    {
        UIImageView *image = [_horizontalStackView.arrangedSubviews lastObject];
        [_horizontalStackView removeArrangedSubview:image];
        [image removeFromSuperview];
        [UIView animateWithDuration:0.25 animations:^{
            [_horizontalStackView layoutIfNeeded];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
