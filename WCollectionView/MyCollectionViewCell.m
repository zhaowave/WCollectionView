//
//  MyCollectionViewCell.m
//  WCollectionView
//
//  Created by wei zhao on 2018/7/15.
//  Copyright © 2018 wei zhao. All rights reserved.
//

#import "MyCollectionViewCell.h"

@interface MyCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation MyCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return  self;
}

- (void) setupUI {
    _titleLabel = [UILabel new];
    CGSize size = self.contentView.frame.size;
    _titleLabel.frame = CGRectMake(0, 0, size.width, size.height/2);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
    _imgView = [UIImageView new];
    _imgView.frame =CGRectMake(0, size.height/2, size.width, size.height/2);
    [self.contentView addSubview:_imgView];
}

- (void) setModel:(MyMdel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    self.imgView.backgroundColor = model.color;
    self.titleLabel.backgroundColor = model.color;
}

- (void) layoutSubviews {
    [super layoutSubviews];
//    self.contentView.backgroundColor = _model.color;
}
@end
