//
//  LocationDetailViewController.m
//  SEMStackViewController
//
//  Created by Sem0043 on 19/04/2018.
//  Copyright © 2018 mahmutpinarbasi. All rights reserved.
//

#import "LocationDetailViewController.h"
#import "UIViewController+SEMStackViewController.h"

@interface LocationDetailViewController ()

@end

@implementation LocationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeAction:(UIButton *)sender {
    [self sem_popViewController];
}


@end
