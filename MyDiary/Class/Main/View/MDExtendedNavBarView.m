//
//  MDExtendedNavBarView.m
//  MyDiary
//
//  Created by SeanChense on 2016/12/4.
//  Copyright © 2016年 seanchense. All rights reserved.
//

#import "MDExtendedNavBarView.h"

#import <Masonry.h>

@implementation MDExtendedNavBarView {
    UILabel *_titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    _titleLabel         = [UILabel new];
    _titleLabel.text    = @"Diary";
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).with.offset(-5);
        make.height.equalTo(@(frame.size.height));
    }];
    return self;
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    // Use the layer shadow to draw a one pixel hairline under this view.
    [self.layer setShadowOffset:CGSizeMake(0, 1.0f/UIScreen.mainScreen.scale)];
    [self.layer setShadowRadius:0];
    
    // UINavigationBar's hairline is adaptive, its properties change with
    // the contents it overlies.  You may need to experiment with these
    // values to best match your content.
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOpacity:0.25f];
}

@end
