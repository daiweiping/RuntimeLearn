//
//  UIButton+ClickBlock.h
//  RuntimeLearn
//
//  Created by 戴尼玛 on 16/4/26.
//  Copyright © 2016年 MIMO. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^clickBlock)(void);

@interface UIButton (ClickBlock)
@property (nonatomic,copy) clickBlock click;
@end
