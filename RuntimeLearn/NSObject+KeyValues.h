//
//  NSObject+KeyValues.h
//  RuntimeLearn
//
//  Created by 戴尼玛 on 16/4/26.
//  Copyright © 2016年 MIMO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KeyValues)

+(id)objectWithKeyValues:(NSDictionary *)aDictionary;

-(NSDictionary *)keyValuesWithObject;

@end
