//
//  OKSpecHelper.m
//  OttomanKit
//
//  Created by Adam Holt on 21/12/2014.
//  Copyright (c) 2014 Adam Holt. All rights reserved.
//

#import "OKSpecHelper.h"

@implementation OKSpecHelper
+ (id)JSONFromLocalFileWithName:(NSString *)name
{
    NSData *data = [[self class] dataWithContentsOfLocalFileWithName:name];
    
    NSError *error = nil;
    id JSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (error)
    {
        return nil;
    }
    
    return JSON;
}

+ (NSString *)contentsOfLocalFileWithName:(NSString *)name
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filePath = [bundle pathForResource:name ofType:@"json"];
    
    return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
}

+ (NSData *)dataWithContentsOfLocalFileWithName:(NSString *)name
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filePath = [bundle pathForResource:name ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    return data;
}
@end
