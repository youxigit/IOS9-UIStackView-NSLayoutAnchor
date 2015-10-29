//
//  ViewController.h
//  TCStackDemon
//
//  Created by qingduan on 15/10/27.
//  Copyright © 2015年 qingduan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIStackView *_horizontalStackView;
    UILabel     *_tips;
    UIImageView *_logoImageView;
    
    UIStackView *_btnStackView;
    UIButton    *_addSmileBtn;
    UIButton    *_removeSmile;
    
    UIStackView *_verticalStackView;
    UIImageView *_smileImageView;
}
@end

