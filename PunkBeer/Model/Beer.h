//
//  Beer.h
//  PunkBeer
//
//  Created by cleanmac-ada on 19/08/22.
//

#import <Foundation/Foundation.h>

#ifndef Beer_h
#define Beer_h

@interface Beer: NSObject

@property (nonatomic) NSInteger id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *tagline;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *imageUrl;
@property (nonatomic) float abv;

- (id) initWithDictionary:(NSDictionary*) dictionary;

@end

#endif /* Beer_h */
