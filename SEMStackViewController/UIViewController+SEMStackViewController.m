//
//  UIViewController+SEMStackViewController.m
//  SEMStackViewController
//
//  Created by Sem0043 on 19/04/2018.
//  Copyright © 2018 mahmutpinarbasi. All rights reserved.
//

#import "UIViewController+SEMStackViewController.h"
#import "SEMStackViewController.h"
@implementation UIViewController (SEMStackViewController)

- (void)sem_showStackViewController:(SEMStackViewController * _Nonnull)stackViewController{
    
    UIView * stackView = stackViewController.view;
    stackView.frame = CGRectMake(CGRectGetWidth(self.view.bounds), 0, stackViewController.itemWidth, CGRectGetHeight(self.view.bounds));
    [self addChildViewController:(UIViewController *)stackViewController];
    [self.view addSubview:stackView];
    [UIView animateWithDuration:0.1 animations:^{
        stackView.frame = CGRectMake(CGRectGetWidth(self.view.bounds)-stackViewController.itemWidth, 0, stackViewController.itemWidth, CGRectGetHeight(self.view.bounds));
    }];
}


- (void)sem_pushViewController:(UIViewController * _Nonnull)viewController{

    SEMStackViewController * stackViewController = (SEMStackViewController *)self.parentViewController;
    [stackViewController pushViewController:viewController];

}

- (UIViewController * _Nullable)sem_popViewController{
    
    SEMStackViewController * stackViewController = (SEMStackViewController *)self.parentViewController;
    return [stackViewController popViewController];
    
}


@end
