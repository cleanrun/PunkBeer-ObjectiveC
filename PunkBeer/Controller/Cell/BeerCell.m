//
//  BeerCell.m
//  PunkBeer
//
//  Created by cleanmac-ada on 19/08/22.
//

#import "BeerCell.h"

@interface BeerCell ()

@property (weak, nonatomic) IBOutlet UIImageView *beerImage;
@property (weak, nonatomic) IBOutlet UILabel *beerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *beerDescriptionLabel;

@end

@implementation BeerCell

+ (NSString*)CELL_IDENTIFIER {
    return @"BeerCell";
}

+ (CGFloat)CELL_HEIGHT {
    return 80;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    UIImage *image = [UIImage systemImageNamed:@"icloud.slash.fill"];
    [self.beerImage setImage:image];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setupUI {
    self.beerImage.layer.cornerRadius = 25;
}

- (void) setupContents:(Beer *)beer {
    self.beerNameLabel.text = beer.name;
    self.beerDescriptionLabel.text = beer.desc;
    
    [self setupImage:beer.imageUrl];
}

- (void) setupImage:(NSString *)urlString {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:urlString];
        
        if (url != nil) {
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [[UIImage alloc] initWithData:data];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.beerImage setImage:image];
            });
        }
    });
}

@end
