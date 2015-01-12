//
//  OKMovie.h
//  Pods
//
//  Created by Adam Holt on 20/12/2014.
//
//

#import "Mantle.h"

typedef enum : NSUInteger {
    OKMovieStatusDone,
    OKMovieStatusActive,
    OKMovieStatusIgnored,
    OKMovieStatusFailed
} OKMovieStatus;

@interface OKMovie : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *_id;

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *tagline;

@property (nonatomic, copy, readonly) NSString *imdb;
@property (nonatomic, copy, readonly) NSString *mpaa;
@property (nonatomic, assign, readonly) NSInteger year;
@property (nonatomic, copy, readonly) NSDate *released;


@property (nonatomic, copy, readonly) NSDictionary *info;
@property (nonatomic, assign, readonly) OKMovieStatus status;

- (NSArray*)posters;
- (NSDictionary*)images;

@end
