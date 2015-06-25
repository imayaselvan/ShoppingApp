//
//  eCommUtillities.m
//  eComm
//
//  Created by Imayaselvan on 25/06/15.
//  Copyright (c) 2015 Imayaselvan. All rights reserved.
//

#import "eCommUtillities.h"

@implementation eCommUtillities
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:((float)a)]

#define UIAppThemeFontColor UIColorFromRGB(0x484e5c)





+ (UIFont *)mediumFontHeaderTwo {
    
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:16.0];
}

@end
