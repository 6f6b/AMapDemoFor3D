//
//  Tools.m
//  AMapDemo
//
//  Created by LiuFeng on 16/2/3.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+ (CGFloat)screenHeight{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return screenHeight;
}
+ (CGFloat)screenWidth{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    return screenWidth;
}

@end