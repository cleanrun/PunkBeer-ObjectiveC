//
//  Webservice.m
//  PunkBeer
//
//  Created by cleanmac-ada on 19/08/22.
//

#import <Foundation/Foundation.h>
#import "Webservice.h"

@interface Webservice ()

@property (strong, nonatomic) NSString *MAIN_ENDPOINT;

@end

@implementation Webservice

static Webservice *_shared = nil;

+ (Webservice*) shared {
    static dispatch_once_t useToken;
    dispatch_once(&useToken, ^{
        _shared = [[self alloc] init];
        _shared.MAIN_ENDPOINT = @"https://api.punkapi.com/v2/beers";
    });
    
    return _shared;
}

- (void) getBeers:(void (^)(NSArray<Beer *> *))completionHandler {
    NSURL *url = [NSURL URLWithString:self.MAIN_ENDPOINT];
    
    if (url != nil) {
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error == nil) {
                if (data != nil) {
                    NSArray *arrayOfRawData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                    NSMutableArray *mutableArrayOfData = [[NSMutableArray alloc] init];
                    
                    for (NSDictionary *dataDict in arrayOfRawData) {
                        Beer *beer = [[Beer alloc] initWithDictionary:dataDict];
                        [mutableArrayOfData addObject:beer];
                    }
                    
                    NSArray *returnArrayOfBeers = [mutableArrayOfData copy];
                    completionHandler(returnArrayOfBeers);
                }
            }
        }];
        [task resume];
    }
}

@end
