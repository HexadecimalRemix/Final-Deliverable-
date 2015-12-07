//
//  BankAccount.m
//  FinalProject
//
//  Created by Pearce Mulkin on 12/7/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import "BankAccount.h"
#import "B1.h"
#import "B2.h"
#import "B3.h"

@interface BankAccount ()

@end

@implementation BankAccount

- (void)viewDidLoad {
        [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationItem.title = @"Accounts";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gotToBBVA:(id)sender{
    B1 *bank = [[B1 alloc]init];
    
    [self.navigationController pushViewController:bank animated:YES];
}

- (IBAction)gotToTegions:(id)sender{
    B2 *bank = [[B2 alloc]init];
    //self.navigationItem.title = @"Regions";
    [self.navigationController pushViewController:bank animated:YES];
}
- (IBAction)gotToVisa:(id)sender {
    B3 *bank = [[B3 alloc]init];
   //self.navigationItem.title = @"Visa";
    [self.navigationController pushViewController:bank animated:YES];
    
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
