//
//  SEMStackViewController.m
//  SEMStackViewController
//
//  Created by Sem0043 on 19/04/2018.
//  Copyright © 2018 mahmutpinarbasi. All rights reserved.
//

#import "SEMStackViewController.h"
#import "SEMStackContentView.h"
@interface SEMStackViewController ()
@property (nonatomic, strong) NSMutableArray<UIViewController *> * viewControllers;
@property (nonatomic, strong) SEMStackContentView * contentView;
@property (nonatomic, strong) UIButton * btnClose;
@end

@implementation SEMStackViewController


- (instancetype _Nonnull)initWithRootViewController:(UIViewController * _Nullable)viewController{
    
    if (self = [super init]) {
        self.view.clipsToBounds = YES;
        self.view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.contentView];
        _viewControllers = (NSMutableArray <UIViewController *> *)[[NSMutableArray alloc] init];
        _itemWidth = [UIScreen mainScreen].bounds.size.width/3;
        
        [self.view addSubview:self.btnClose];
        [self pushViewController:viewController];
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Public
- (void)pushViewController:(UIViewController * _Nonnull)viewController{
    if (viewController==nil) {
        return;
    }
    [self addViewController:viewController];
}

- (UIViewController * _Nullable)popViewController{
    
    if (self.viewControllers.count == 0) {
        return nil;
    }
    
    UIViewController * controller = [self.viewControllers objectAtIndex:self.viewControllers.count-1];
    [self removeViewController:controller];
    return controller;
}


#pragma mark - Private
- (void)updateViewFrame:(CGRect)newFrame animated:(BOOL)animated completion:(void(^)(void))completion{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = newFrame;
    } completion:^(BOOL finished) {
        completion();
    }];
    
}

- (CGFloat)parentWidth{
    return CGRectGetWidth(self.parentViewController.view.frame);
}

#pragma mark - Private Properties
- (UIButton *)btnClose{
    if (_btnClose==nil) {
        _btnClose = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds)-20.0-44.0, 20, 44.0, 44.0)];
        _btnClose.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [_btnClose addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
        _btnClose.backgroundColor = [UIColor yellowColor];
    }
    return _btnClose;
}

- (SEMStackContentView *)contentView{
    if (_contentView == nil) {
        _contentView = [[SEMStackContentView alloc] initWithFrame:self.view.bounds];
    }
    return _contentView;
}

#pragma mark - Private View Layout
- (void)addViewController:(UIViewController *)viewController{
    
    [self.viewControllers addObject:viewController]; // add view controller to array.
    [self addChildViewController:viewController];
    
    UIView * newView = viewController.view;
    NSInteger numberOfViewControllers = self.viewControllers.count;
    [self.contentView addSubview:newView];
    
    CGRect viewRect = self.view.frame;
    viewRect.origin.x = [self parentWidth]-(numberOfViewControllers * self.itemWidth);;
    viewRect.size.width = numberOfViewControllers * self.itemWidth;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = viewRect;
    } completion:NULL];
    
}

- (void)removeViewController:(UIViewController *)viewController{
    
    [self.viewControllers removeObject:viewController];
    
    CGFloat newWidth = self.viewControllers.count * self.itemWidth;
    CGRect currentFrame = self.view.frame;
    currentFrame.origin.x = [self parentWidth]-newWidth;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect viewRect = self.view.frame;
                         viewRect.origin.x = [self parentWidth]-newWidth;;
                         self.view.frame = viewRect;
                     } completion:^(BOOL finished) {
                         
                         for (UIView * subview in self.contentView.subviews) {
                             if ([subview isEqual:viewController.view]) {
                                 [subview removeFromSuperview];
                                 [viewController removeFromParentViewController];
                                 break;
                             }
                         }
                         
                         CGRect viewRect = self.view.frame;
                         viewRect.size.width = self.viewControllers.count * self.itemWidth;;
                         self.view.frame = viewRect;
                         
                     }];
    
}


#pragma mark - Private Actions
- (void)closeAction:(UIButton *)button{
    [self popViewController];
}


@end
