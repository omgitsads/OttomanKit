//
//  OKMovie.m
//  Pods
//
//  Created by Adam Holt on 20/12/2014.
//
//

#import "OKMovie.h"
#import <BlocksKit.h>

@interface OKMovie ()
+ (NSDateFormatter*)dateFormatter;
@end

@implementation OKMovie

+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *kDateFormatter = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        kDateFormatter = [[NSDateFormatter alloc] init];
        kDateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        kDateFormatter.dateFormat = @"yyyy-MM-dd";  // you configure this based on the strings that your webservice uses!!
    });
    
    return kDateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"tagline": @"info.tagline",
             @"imdb": @"info.imdb",
             @"mpaa": @"info.mpaa",
             @"year": @"info.year",
             @"released": @"info.released"
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
                                                                           @"active": @(OKMovieStatusActive),
                                                                           @"done": @(OKMovieStatusDone),
                                                                           @"failed": @(OKMovieStatusFailed),
                                                                           @"ignored": @(OKMovieStatusIgnored),
                                                                           }];
}

- (NSDictionary*)images
{
    return self.info[@"images"];
}

- (NSArray*)posters
{
    return [((NSArray*)self.images[@"poster"]) bk_map:^id(NSString *posterURLString) {
        return [[NSURL alloc] initWithString:posterURLString];
    }];
}

+ (NSValueTransformer *)releasedJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [[self dateFormatter] dateFromString:str];
    } reverseBlock:^(NSDate *date) {
        return [[self dateFormatter] stringFromDate:date];
    }];
}

@end
