//
//  Beer.m
//  PunkBeer
//
//  Created by cleanmac-ada on 19/08/22.
//

#import <Foundation/Foundation.h>
#import "Beer.h"

@interface Beer ()

@end

@implementation Beer

- (id) initWithDictionary:(NSDictionary*) dictionary {
    Beer* beer = [[Beer alloc] init];
    
    beer.id = [[dictionary valueForKey:@"id"] intValue];
    beer.name = [dictionary valueForKey:@"name"];
    beer.tagline = [dictionary valueForKey:@"tagline"];
    beer.desc = [dictionary valueForKey:@"description"];
    beer.imageUrl = [dictionary valueForKey:@"image_url"];
    beer.abv = [[dictionary valueForKey:@"abv"] floatValue];
    
    return beer;
}

@end
