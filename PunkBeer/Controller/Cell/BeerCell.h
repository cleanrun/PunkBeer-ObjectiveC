//
//  BeerCell.h
//  PunkBeer
//
//  Created by cleanmac-ada on 19/08/22.
//

#import <UIKit/UIKit.h>
#import "Beer.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerCell : UITableViewCell

+ (NSString*) CELL_IDENTIFIER;
+ (CGFloat) CELL_HEIGHT;

- (void) setupContents:(Beer *) beer;

@end

NS_ASSUME_NONNULL_END
