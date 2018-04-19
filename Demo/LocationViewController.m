//
//  LocationViewController.m
//  SEMStackViewController
//
//  Created by Sem0043 on 19/04/2018.
//  Copyright © 2018 mahmutpinarbasi. All rights reserved.
//

#import "LocationViewController.h"
#import "SEMStackViewController.h"
#import "LocationDetailViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)closeAction:(UIButton *)sender {
    [self sem_popViewController];
}


- (IBAction)showLocationDetail:(UIButton *)sender{
    
    LocationDetailViewController * vc = [[LocationDetailViewController alloc] initWithNibName:@"LocationDetailViewController" bundle:nil];
    [self sem_pushViewController:vc];
    
}
@end
