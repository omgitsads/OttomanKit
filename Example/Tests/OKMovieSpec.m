//
//  OKMovieSpec.m
//  OttomanKit
//
//  Created by Adam Holt on 21/12/2014.
//  Copyright (c) 2014 Adam Holt. All rights reserved.
//

#import "OttomanKit.h"
#import "OKSpecHelper.h"

SpecBegin(OKMovieSpec)

NSDictionary *movieJSON = [OKSpecHelper JSONFromLocalFileWithName:@"movie"];
OKMovie *movie = [MTLJSONAdapter modelOfClass:[OKMovie class] fromJSONDictionary:movieJSON error:nil];

describe(@"attributes", ^{
    it(@"populates attributes", ^{
        expect(movie._id).toNot.beNil;
        expect(movie.title).toNot.beNil;
        expect(movie.tagline).toNot.beNil;
        expect(movie.mpaa).toNot.beNil;
        expect(movie.imdb).toNot.beNil;
        expect(movie.year).toNot.beNil;
        expect(movie.year).to.equal(2012);
        expect(movie.released).toNot.beNil;
    });
});

describe(@"posters", ^{
    it(@"has 3 posters", ^{
        expect(movie.posters).to.haveCountOf(3);
    });
    
    it(@"returns an array of NSURLs", ^{
        expect(movie.posters.firstObject).to.beInstanceOf([NSURL class]);
    });
});

SpecEnd