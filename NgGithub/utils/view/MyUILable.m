//
//  MyUILable.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/28.
//

#import "MyUILable.h"

@implementation MyUILable

- (void)setContentInset:(UIEdgeInsets)contentInset{
    
    _contentInset = contentInset;
    
//    初始化设置时，不需要更改text。如果是触控其他方法再更改内间距时，要更改text，使drawTextInRect:方法自动调用
    if (self.superview) {
        NSString *tempText = self.text;
        self.text = @"";
        self.text = tempText;
    }
}

- (void)drawTextInRect:(CGRect)rect{
    CGRect actualRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    //UIEdgeInsetsMake
    [super drawTextInRect:UIEdgeInsetsInsetRect(actualRect, _contentInset)];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentMiddle;
    }
     
    return self;
}
 
/**
 *  设置属性方法
 *
 *  @param verticalAlignment 垂直调整位置
 */
- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment
{
    _verticalAlignment = verticalAlignment;
     
    [self setNeedsDisplay];
}
 
/**
 *  计算文字的矩形区域
 *
 *  @param bounds        label矩形区域
 *  @param numberOfLines 行数
 *
 *  @return 返回文字所占的矩形区域
 */
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
     
    //通过设定字体区域的y值来调整垂直位置
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentMiddle:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
    }
     
    return textRect;
}
 

 
@end
