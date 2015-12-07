//
//  ViewController.m
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import "MainViewController.h"
#import "BudgetControllerViewController.h"
#import "AccountController.h"
#import "LoginViewController.h"
#import "BankAccount.h"
#import "Stocks.h"


@interface MainViewController ()

@end
int checker = 0;

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
        NSLog(@"[MainViewController] Init");
        
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated{
}
- (void)viewWillAppear:(BOOL)animated{
    if (checker == 0){
        LoginViewController *log = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:log animated:YES];
        self.navigationController.navigationBarHidden = YES;
        checker++;
    }
}


-(IBAction)toBudget:(id)sender{
    Budget *pickedBudget = [self loadCustomObjectWithKey:@"budgetKey1"];
    if (!pickedBudget){
        Budget *picketBudget2 =[[Budget alloc]init];
        BudgetControllerViewController *budget2 = [[BudgetControllerViewController alloc]initWithObject:picketBudget2];
        self.navigationController.navigationBarHidden = NO;
        [self.navigationController pushViewController:budget2 animated:YES];
    }
    else{
        BudgetControllerViewController *budget = [[BudgetControllerViewController alloc]initWithObject:pickedBudget];
        self.navigationController.navigationBarHidden = NO;
        [self.navigationController pushViewController:budget animated:YES];
    }
    
}
-(IBAction)toBank:(id)sender{
    BankAccount *bank = [[BankAccount alloc]init];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:bank animated:YES];
}
-(IBAction)toStock:(id)sender{
    self.navigationController.navigationBarHidden = NO;
    Stocks *stock =[[Stocks alloc ]init];
    [self.navigationController pushViewController:stock animated:YES];
}
- (Budget *)loadCustomObjectWithKey:(NSString *)key {
    NSData *getData = [[NSData alloc] initWithData:[[NSUserDefaults standardUserDefaults] objectForKey:key]];
    Budget *object;
    [getData getBytes:&object length:getData.length];
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *encodedObject = [defaults objectForKey:key];
//    Budget *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

@end
