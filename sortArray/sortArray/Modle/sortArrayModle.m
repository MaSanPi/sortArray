//
//  sortArrayModle.m
//  sortArray
//
//  Created by 马波 on 2018/9/13.
//  Copyright © 2018年 MB. All rights reserved.
//

#import "sortArrayModle.h"

@implementation sortArrayModle
-(NSString*)date{
    
    NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    fmt.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSDate *createdDate = [NSDate dateWithTimeIntervalSince1970:_time];
    fmt.dateFormat = @"YYYY-MM-dd HH:mm";
    return [fmt stringFromDate:createdDate];
    
}

@end
