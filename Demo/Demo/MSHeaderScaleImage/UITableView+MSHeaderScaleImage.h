//
//  UITableView+MSHeaderScaleImage.h
//  Demo
//
//  Created by MrSong on 2016/11/27.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (MSHeaderScaleImage)

/// 图片，必须设置
@property (nonatomic, strong) UIImage *ms_headerScaleImage;
/// 默认显示区域的高度，必须设置
@property (nonatomic, assign) CGFloat ms_defaultDisplayRectHeight;

@end
