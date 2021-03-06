//
//  KeyNumberCollectionViewCell.h
//  Stories
//
//  Created by PENRATH Jean-baptiste on 14/11/2014.
//  Copyright (c) 2014 Jb & Anto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JAUITextView.h"
#import "JAUILabel.h"

@interface JAKeyNumberCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) JAManagerData* manager;
@property (strong, nonatomic) JAUITextView *numberLabel;
@property (strong, nonatomic) JAUILabel *descriptionLabel;
@property (nonatomic) CGFloat maxParallaxOffset;

@end
