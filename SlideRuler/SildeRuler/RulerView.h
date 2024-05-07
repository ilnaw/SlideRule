//
//  RulerView.h
//  TYFitFore
//
//  Created by apple on 2018/7/5.
//  Copyright © 2018年 tangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RulerCollectionViewCell.h"

@protocol RulerViewDelegate <NSObject>

- (void)rulerSelectValue:(double)value tag:(NSInteger)tag;

@end

@interface RulerConfig : NSObject

//视图属性
@property (nonatomic, assign) CGFloat shortScaleLength;                         /**< 短刻度长度  */
@property (nonatomic, assign) CGFloat longScaleLength;                          /**< 长刻度长度  */
@property (nonatomic, assign) CGFloat scaleWidth;                               /**< 刻度尺宽度  */
@property (nonatomic, strong) UIColor *scaleColor;                              /**< 刻度颜色  */
@property (nonatomic, assign) CGFloat shortScaleStart;                          /**< 短刻度起始位置  */
@property (nonatomic, assign) CGFloat longScaleStart;                           /**< 长刻度起始位置  */
@property (nonatomic, assign) CGFloat distanceBetweenScale;                     /**< 刻度之间的距离  */
@property (nonatomic, assign) RulerNumberDirection numberDirection;             /**< 数字方向  */
@property (nonatomic, assign) CGFloat distanceFromScaleToNumber;                /**< 刻度和数字之间的距离  */
//指示器
@property (nonatomic, assign) CGSize pointSize;                                 /**< 指示视图宽高  */
@property (nonatomic, strong) UIColor *pointColor;                              /**< 指示视图颜色  */
@property (nonatomic, assign) CGFloat pointStart;                               /**< 指示器视图起始位置  */
//数字属性
@property (nonatomic, strong) UIFont *numberFont;                               /**< 数字字体  */
@property (nonatomic, strong) UIColor *numberColor;                             /**< 数字颜色  */
//刻度相关
@property (nonatomic, assign) NSInteger max;                                    /**< 最大值  */
@property (nonatomic, assign) NSInteger min;                                    /**< 最小值  */
@property (nonatomic, assign) double defaultNumber;                             /**< 默认值  */
@property (nonatomic, assign) NSInteger offset;                                 /**< 每次偏移的刻度尺单位  */
//选项
@property (nonatomic, assign) BOOL isDecimal;                                   /**< 保留一位小数类型  */
@property (nonatomic, assign) BOOL selectionEnable;                             /**< 是否允许选中  */
@property (nonatomic, assign) BOOL useGradient;                                 /**< 是否使用渐变色  */
@property (nonatomic, assign) BOOL reverse;                                     /**< 刻度尺反向  */
@property (nonatomic, assign) BOOL infiniteLoop;                                /**< 刻度尺循环  */
@property (nonatomic, strong) UIColor *selectColor;                             /**< 选中颜色  */
@property (nonatomic, strong) UIFont *selectFont;                               /**< 选中字体  */

+ (instancetype)defaultConfig;

@end

@interface RulerView : UIView

@property (nonatomic, strong) RulerConfig *rulerConfig;                         /**< 属性设置  */
@property (nonatomic, weak) id<RulerViewDelegate> delegate;                     /**< 代理  */ 

@end
