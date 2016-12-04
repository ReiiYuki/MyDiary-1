//
//  MDMainViewController.h
//  MyDiary
//
//  Created by SeanChense on 2016/12/4.
//  Copyright © 2016年 seanchense. All rights reserved.
//

#import "MDBaseViewController.h"

typedef NS_ENUM(NSInteger, MDMainViewControllerStyle) {
    MDMainViewControllerStyleNone = -1,
    MDMainViewControllerStyleEntry,
    MDMainViewControllerStyleCalendar,
    MDMainViewControllerStyleDairy
};

@interface MDMainViewController : MDBaseViewController
@property (nonatomic, assign, readonly) MDMainViewControllerStyle controllerStyle;
@end
