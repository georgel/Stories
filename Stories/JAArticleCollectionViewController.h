//
//  ArticleCollectionViewController.h
//  Stories
//
//  Created by PENRATH Jean-baptiste on 14/11/2014.
//  Copyright (c) 2014 Jb & Anto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JATitleCollectionViewCell.h"
#import "JAResumeCollectionViewCell.h"
#import "JAParagraphCollectionViewCell.h"
#import "JAImageCollectionViewCell.h"
#import "JAQuotesCollectionViewCell.h"
#import "JAKeyNumberCollectionViewCell.h"
#import "JAStoriesModel.h"
#import "JAStorieModel.h"
#import "JAChapterModel.h"
#import "JABlockModel.h"
#import "JAManagerData.h"
#import "JAUILabel.h"
#import "JAUITextView.h"

@interface JAArticleCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSArray *blocks;
@property (strong, nonatomic) NSMutableArray *text;
@property (strong, nonatomic) IBOutlet UICollectionView *articleCollectionView;
@property (nonatomic,strong) JAManagerData *manager;
@property (nonatomic,strong) JABlockModel *currentBlock;
@property (strong, nonatomic) NSMutableArray *resumesID;
@end
