//
//  TestModel.h
//  RuntimeLearn
//
//  Created by 戴尼玛 on 16/4/26.
//  Copyright © 2016年 MIMO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, copy) NSNumber *phoneNumber;
@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, strong) NSDictionary *info;
@property (nonatomic, strong) TestModel *son;
@end
