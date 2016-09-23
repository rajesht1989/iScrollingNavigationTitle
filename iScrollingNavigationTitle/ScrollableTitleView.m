//
//  ScrollableTitleView.m
//  iScrollingNavigationTitle
//
//  Created by Rajesh on 8/13/15.
//  Copyright (c) 2015 Org. All rights reserved.
//

#import "ScrollableTitleView.h"
#define LABEL_TAG 999
@implementation ScrollableTitleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)titleViewWithFrame:(CGRect )rect andTitle:(NSString *)title
{
    return [[self alloc] initWithFrame:rect andTitle:title];
}
- (instancetype)initWithFrame:(CGRect )rect andTitle:(NSString *)title
{
    self = [super initWithFrame:rect];
    if (self)
    {
        CGRect rectTxt = [title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 44) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil];
        rectTxt.origin.y = 0;
        rectTxt.size.height = rect.size.height;
        UILabel *label = [[UILabel alloc] initWithFrame:rectTxt];
        [label setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTag:LABEL_TAG];
        [label setFont:[UIFont systemFontOfSize:15]];
        [self addSubview:label];
        [self setContentSize:rectTxt.size];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setScrollsToTop:NO];
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            CGRect rectLbl = label.frame;
            [label setText:title];
            if (self.frame.size.width > rectLbl.size.width)
            {
                [label setCenter:self.center];
                rectLbl.size.width = self.frame.size.width;
                [label setFrame:rectLbl];
            }
            else
            {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self setContentOffset:CGPointMake(self.contentSize.width - self.bounds.size.width,0) animated:YES];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [self setContentOffset:CGPointMake(0,0) animated:YES];
                    });
                });
            }
        });
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
