//
//  OKSpecHelper.h
//  OttomanKit
//
//  Created by Adam Holt on 21/12/2014.
//  Copyright (c) 2014 Adam Holt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKSpecHelper : NSObject
+ (id)JSONFromLocalFileWithName:(NSString *)name;
+ (NSString *)contentsOfLocalFileWithName:(NSString *)name;
+ (NSData *)dataWithContentsOfLocalFileWithName:(NSString *)name;
@end
