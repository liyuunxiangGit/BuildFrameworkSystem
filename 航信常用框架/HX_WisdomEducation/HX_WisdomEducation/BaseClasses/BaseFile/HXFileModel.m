//
//  HXFileModel.m
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/5/5.
//

#import "HXFileModel.h"

@implementation HXFileModel



+ (HXFileModel *)localFileModelWithImage:(UIImage *)image
{
    HXFileModel *model = [[HXFileModel alloc] init];
    model.image        = image;
    model.addressType  = FileAddressType_Path;
    model.mime         = nil;
    return model;
}

+ (NSArray<HXFileModel *> *)localFileModelWithArr:(NSArray<UIImage *> *)array
{
    NSMutableArray *modelArr = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (UIImage *img in array)
    {
        [modelArr addObject:[self localFileModelWithImage:img]];
    }
    return modelArr.copy;
}
@end
