//
//  UIImage+Color.m
//  DTMGSDK
//
//  Created by 周峰 on 15/12/29.
//  Copyright © 2015年 guoxuzan. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (nullable UIImage *)imageNewNamed:(NSString *)name {
    NSString *newName = [NSString stringWithFormat:@"DTMGResources.bundle/%@",name];
    return [UIImage imageNamed:newName];
}


@end
