//
//  Webservice.h
//  PunkBeer
//
//  Created by cleanmac-ada on 19/08/22.
//

#import <Foundation/Foundation.h>
#import "Beer.h"

#ifndef Webservice_h
#define Webservice_h

@interface Webservice: NSObject

+ (Webservice*)shared;

- (void) getBeers:(void (^) (NSArray<Beer *> *data))completionHandler;

@end

#endif /* Webservice_h */
