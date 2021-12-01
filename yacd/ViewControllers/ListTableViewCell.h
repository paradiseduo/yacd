//
//  ListTableViewCell.h
//  yacd
//
//  Created by admin on 2021/6/29.
//  Copyright © 2021 Selander. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UILabel *state;

@end

NS_ASSUME_NONNULL_END
