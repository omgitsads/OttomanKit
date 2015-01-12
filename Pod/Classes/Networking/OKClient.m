//
//  OKClient.m
//  Pods
//
//  Created by Adam Holt on 20/12/2014.
//
//

#import "OKClient.h"

NSString * const OKClientErrorDomain = @"OKClientErrorDomain";

@implementation OKClient

+ (instancetype)sharedClient
{
    static OKClient *sharedOKClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedOKClient = [[OKClient alloc] init];
    });
    
    return sharedOKClient;
}

- (id)init
{
    if (self = [super initWithBaseURL:[[self class] APIBaseURL]])
    {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    
    return self;
}

+ (NSURL*)APIBaseURL
{
    return [[NSURL alloc] initWithString:@"http://couchpotato.com"];
}

- (BOOL)isAuthenticated
{
    return self.apiToken ? YES : NO;
}

@end
