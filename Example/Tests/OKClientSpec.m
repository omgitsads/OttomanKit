//
//  OKClientSpec.m
//  OttomanKit
//
//  Created by Adam Holt on 20/12/2014.
//  Copyright (c) 2014 Adam Holt. All rights reserved.
//

#import "OttomanKit.h"
#import <BlocksKit.h>

SpecBegin(OKClientSpec)

OKClient *client = [[OKClient alloc] init];
client.apiToken = @"";

describe(@"isAuthenticated", ^{
    it(@"should be authenticated", ^{
        expect(client.isAuthenticated).to.beTruthy();
    });
    
    it(@"should not be authenticated", ^{
        client.apiToken = nil;
        expect(client.isAuthenticated).to.beFalsy();
    });
});

SpecEnd