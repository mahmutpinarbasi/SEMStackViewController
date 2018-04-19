//
//  ViewController.m
//  SEMStackViewController
//
//  Created by Sem0043 on 19/04/2018.
//  Copyright © 2018 mahmutpinarbasi. All rights reserved.
//

#import "ViewController.h"
#import "SEMStackViewController.h"
#import "LocationViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showStack:(id)sender {

    LocationViewController * location = [[LocationViewController alloc] initWithNibName:@"LocationViewController" bundle:nil];
    SEMStackViewController * stackViewController = [[SEMStackViewController alloc] initWithRootViewController:location];
    [self sem_showStackViewController:stackViewController];

    
}


@end
