//
//  B1.m
//  FinalProject
//
//  Created by Pearce Mulkin on 12/7/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import "B1.h"

@interface B1 ()

@end

@implementation B1
@synthesize BBVA;
@synthesize Regions;
@synthesize Visa;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"BBVA";
    // Do any additional setup after loading the view.
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

@end
