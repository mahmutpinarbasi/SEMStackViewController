//
//  UIViewController+SEMStackViewController.h
//  SEMStackViewController
//
//  Created by Sem0043 on 19/04/2018.
//  Copyright © 2018 mahmutpinarbasi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SEMStackViewController;
@interface UIViewController (SEMStackViewController)

- (void)sem_showStackViewController:(SEMStackViewController * _Nonnull)stackViewController;


- (void)sem_pushViewController:(UIViewController * _Nonnull)viewController; // adds view controller to the end of stack
- (UIViewController * _Nullable)sem_popViewController; /// pops the last view controller if exist and return, returns nil otherwise


@end
