//
//  SEMStackViewController.h
//  SEMStackViewController
//
//  Created by Sem0043 on 19/04/2018.
//  Copyright © 2018 mahmutpinarbasi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+SEMStackViewController.h"

@interface SEMStackViewController : UIViewController

- (instancetype _Nonnull)initWithRootViewController:(UIViewController * _Nullable)viewController;


- (void)pushViewController:(UIViewController * _Nonnull)viewController; // adds view controller to the end of stack
- (UIViewController * _Nullable)popViewController; /// pops the last view controller if exist and return, returns nil otherwise



@property (nonatomic, assign) CGFloat itemWidth; /// Item width for each UIViewController. Default value is [UIScreen mainScreen].bounds.size.width/3;
@property (nonatomic, assign) BOOL closeButtonHidden; /// `SEMStackViewController` has a UIButton on right top corner to pop last view controller. This property changes the visibility of this button. Default value is NO
@property (nonatomic, strong) UIImage * _Nullable closeButtonImage; /// The UIImage for close button.

@end
