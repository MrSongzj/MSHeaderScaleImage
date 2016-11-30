//
//  UITableView+MSHeaderScaleImage.m
//  Demo
//
//  Created by MrSong on 2016/11/27.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import "UITableView+MSHeaderScaleImage.h"
#import <objc/runtime.h>

@implementation UITableView (MSHeaderScaleImage)

#pragma mark - Getter

- (UIImageView *)ms_headerImageView
{
    UIImageView *imageView = objc_getAssociatedObject(self, _cmd);
    if (imageView == nil) {
        
        imageView = [[UIImageView alloc] init];
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        // 插到 tableView 的底部，防止盖住 tableHeaderView
        [self insertSubview:imageView atIndex:0];
        
        objc_setAssociatedObject(self, _cmd, imageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return imageView;
}

- (UIImage *)ms_headerScaleImage
{
    return self.ms_headerImageView.image;
}

- (CGFloat)ms_defaultDisplayRectHeight
{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

#pragma mark - Setter

- (void)setMs_defaultDisplayRectHeight:(CGFloat)ms_defaultDisplayRectHeight
{
    objc_setAssociatedObject(self, @selector(ms_defaultDisplayRectHeight), @(ms_defaultDisplayRectHeight),OBJC_ASSOCIATION_ASSIGN);
    
    self.ms_headerImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.ms_defaultDisplayRectHeight);
}

- (void)setMs_headerScaleImage:(UIImage *)ms_headerScaleImage
{
    if (self.ms_headerScaleImage != nil) {
        [self removeObserver:self forKeyPath:@"contentOffset"];
    }
    
    self.ms_headerImageView.image = ms_headerScaleImage;
    
    if (ms_headerScaleImage != nil) {
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
}

#pragma mark - Key Value Observe

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    // 获取当前偏移量
    CGFloat offsetY = self.contentOffset.y;
    CGFloat top = self.contentInset.top;
    if (offsetY <= -top) {
        // 只需要改变 y 的值和高度，考虑了设置 tableView 的 contentInset 的 top 的情况
        CGRect frame = self.ms_headerImageView.frame;
        frame.origin.y = top + offsetY;
        frame.size.height = self.ms_defaultDisplayRectHeight - offsetY - top;
        self.ms_headerImageView.frame = frame;
    }
}

#pragma mark - Life Cycle

- (void)dealloc
{
    if (self.ms_headerScaleImage) {
        
        [self removeObserver:self forKeyPath:@"contentOffset"];
    }
}

@end
