//
//  HXFileCell.h
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/5/5.
//

#import <UIKit/UIKit.h>
@class HXFileCell;
@class HXFileModel;

@protocol HXFileCellDelegate<NSObject>
@optional
/**
 *@ 触发长按手势
 */
- (void)cellFile:(HXFileCell *)cell didChickLongPressItemWithFile:(HXFileModel *)file index:(NSInteger)index;

@end

@interface HXFileCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bg_imageView;

/** 文件数据 */
@property (nonatomic, strong) HXFileModel *file;

/** 下标  标记 */
@property (nonatomic, assign) NSInteger index;
/** 代理 */
@property (nonatomic, weak) id<HXFileCellDelegate> delegate;

@end
