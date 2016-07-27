//
//  BYCellReuseTutorialTableViewCell.m
//  CellReuseTutorial
//
//  Created by yassine benabbas on 24/08/2014.
//  Copyright (c) 2014 org.yostane.ios.tutorial. All rights reserved.
//

#import "BYCellReuseTutorialTableViewCell.h"

@implementation BYCellReuseTutorialTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

-(void)prepareForReuse
{
    //The cell is going to be reused
    NSLog(@"reusing cell with title label: %@", self.titleLabel.text);
}

@end
