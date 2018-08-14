//
//  HXFileCell.m
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/5/5.
//

#import "HXFileCell.h"
#import "HXFileModel.h"
#import "UIImageView+EMWebCache.h"
@implementation HXFileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(chickLongPressGestureRecognizer:)];
    [self addGestureRecognizer:longPress];
}


- (void)setFile:(HXFileModel *)file{
    _file = file;
    if (file.addressType == FileAddressType_Path) {
        self.bg_imageView.image = file.image;
    }else{
        [self.bg_imageView sd_setImageWithURL:[NSURL URLWithString:file.mime] placeholderImage:[UIImage sd_animatedGIFWithData:placeHolder_300_300_imageData]];
    }
    
}

#pragma mark - Action
- (void)chickLongPressGestureRecognizer:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        if ([self.delegate respondsToSelector:@selector(cellFile:didChickLongPressItemWithFile:index:)]) {
            [self.delegate cellFile:self didChickLongPressItemWithFile:self.file index:self.index];
        }
    }
}

@end
