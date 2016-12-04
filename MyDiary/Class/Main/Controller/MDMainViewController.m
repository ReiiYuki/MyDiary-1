//
//  MDMainViewController.m
//  MyDiary
//
//  Created by SeanChense on 2016/12/4.
//  Copyright © 2016年 seanchense. All rights reserved.
//

#import "MDMainViewController.h"
#import "MDExtendedNavBarView.h"
#import "MDEntryViewController.h"

#import <Masonry.h>

static const CGFloat navBarViewHeight = 40.f;

@interface MDMainViewController ()
@property (nonatomic, strong) MDExtendedNavBarView *extendedNavBarView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) MDEntryViewController *entryController;

@property (nonatomic, assign, readwrite) MDMainViewControllerStyle controllerStyle;
@end

@implementation MDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    CGRect barViewFrame     = CGRectMake(0, 0,
                                         self.view.frame.size.width, navBarViewHeight);
    self.extendedNavBarView = [[MDExtendedNavBarView alloc] initWithFrame:barViewFrame];
    [self.view addSubview:self.extendedNavBarView];
    [self.extendedNavBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@(barViewFrame.size.height));
    }];
        
    
    
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[
                                                                        @"Entries",
                                                                        @"Calendar",
                                                                        @"Dairy"]];
    [self.segmentedControl addTarget:self
                              action:@selector(segmentedControlDidSelect)
                    forControlEvents:UIControlEventValueChanged];
    self.controllerStyle  = MDMainViewControllerStyleEntry;
    self.segmentedControl.selectedSegmentIndex = self.controllerStyle;
    //--------- simulate user interface event
    [self segmentedControlDidSelect];
    //--------- simulate end
    [self.navigationItem setTitleView:self.segmentedControl];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
}

#pragma mark User Interface
- (void)segmentedControlDidSelect {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case MDMainViewControllerStyleEntry: {
            [self addChildViewController:self.entryController];
            [self.view addSubview:self.entryController.view];
            [self.entryController.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(navBarViewHeight, 0, 0, 0));
            }];
        }
            break;
            
        default:
            break;
    }
}


#pragma mark - getter
- (MDEntryViewController *)entryController {
    if (!_entryController) {
        _entryController = [[MDEntryViewController alloc] init];
    }
    
    return _entryController;
}
@end
