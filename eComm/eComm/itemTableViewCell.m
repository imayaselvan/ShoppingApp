//
//  itemTableViewCell.m
//  eComm
//
//  Created by Imayaselvan on 25/06/15.
//  Copyright (c) 2015 Imayaselvan. All rights reserved.
//

#import "itemTableViewCell.h"
#import "eCommUtillities.h"
@interface itemTableViewCell ()

@property (nonatomic, strong)UIImageView *avatarView;
@end

@implementation itemTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createSubViews];
    }
    return self;
}

#pragma-mark createSubViews

- (void)createSubViews {
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.font =[eCommUtillities mediumFontHeaderTwo];
    self.titleLabel.textColor =[UIColor lightGrayColor];
    self.titleLabel.userInteractionEnabled = YES;
    [self.contentView addSubview:self.titleLabel];
    
    
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.countLabel.textColor = [UIColor lightGrayColor];
    self.countLabel.textAlignment = NSTextAlignmentRight;
    self.countLabel.font =[eCommUtillities mediumFontHeaderTwo];
    self.countLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.countLabel];
    
    UIStepper *stepperOne = [[UIStepper alloc] initWithFrame:CGRectMake(100, 0, 60, 32)];
    [stepperOne addTarget:self action:@selector(stepperOneChanged:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:stepperOne];
    

}
- (void)stepperOneChanged:(UIStepper*)stepperOne{

}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame =CGRectMake(0, 0, 200, 26);
    // Timestamp label.
}

#pragma mark - Prepare for reuse
- (void)prepareForReuse {
    [super prepareForReuse];
    self.titleLabel.text = nil;
    self.countLabel.text = nil;
}

+ (NSString *)reuseIdentifier {
    return @"itemCellReuseIdentifier";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
