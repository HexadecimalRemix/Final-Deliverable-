////
//  Budget.h
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BudgetControllerViewController.h"

@interface Budget : NSObject <UIAlertViewDelegate> {
    NSMutableArray *sections;
    NSMutableArray *income;
    NSNumber *totalIncome;
    NSNumber *totalExpenses;
    NSNumber *totalAvailableFunds;
}

-(void)selectAddIncome:(UIViewController*)view;
-(void)selectAddBudgetSection:(UIViewController*)view;
//-(void)setBudget:(BudgetControllerViewController*)control;
@property (nonatomic, readwrite) NSMutableArray *sections;
@property (nonatomic, readwrite) NSMutableArray *income;
@property (nonatomic, readwrite) NSNumber *totalIncome;
@property (nonatomic, readwrite) NSNumber *totalExpenses;
@property (nonatomic, readwrite) NSNumber *totalAvailableFunds;
@end
