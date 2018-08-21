//
//  HXFileModel.h
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/5/5.
//

#import "BaseModel.h"



@interface HXFileModel : BaseModel

/**
 *@ 图片
 */
@property (nonatomic, strong) UIImage *image;

/**
 *@ 本地文件路径
 */
@property (nonatomic, strong) NSString *filePath;

/**
 *@ 网络文件路径
 */
@property (nonatomic, strong) NSString *mime;

@property (nonatomic, assign) FileAddressType addressType; //文件来源 

+ (NSArray<HXFileModel *> *)localFileModelWithArr:(NSArray<UIImage *> *)array;

@end
