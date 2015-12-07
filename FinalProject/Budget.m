//
//  Budget.m
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import "Budget.h"
#import "Section.h"
#import "Income.h"
//#import "BudgetControllerViewController.h"
@import Foundation;

@implementation Budget
@synthesize income;
@synthesize sections;
@synthesize totalAvailableFunds;
@synthesize totalExpenses;
@synthesize totalIncome;
UITextField *labelText;
UITextField *amountText;
//BudgetControllerViewController *budget;

- (id)init
{
    self = [super init];
    if (self)
    {
        income = [[NSMutableArray alloc]init];
        sections = [[NSMutableArray alloc]init];
        totalAvailableFunds = 0;
     //   totalExpenses = 0;
        totalIncome = 0;
        
    }
    return self;
}
//-(void)setBudget:(BudgetControllerViewController*)control{
//    budget = control;
//}
-(void)selectAddBudgetSection:(UIViewController*)view{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Add Section"
                                          message:@"Please enter a label and an allownace in the fields below"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Budget Sections Placeholder", @"");
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Section Allowance Placeholder", @"");
         textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
         [textField setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
         [textField reloadInputViews];
     }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   labelText = alertController.textFields.firstObject;
                                   amountText = alertController.textFields.lastObject;
                                   Section *newSection = [[Section alloc]init];
                                   newSection.sectionAmount = amountText.text;
                                   newSection.sectionLabel = labelText.text;
                                   [self addNewSection:newSection];
                                   
                               }];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
    [alertController addAction:cancelAction];

    [alertController addAction:okAction];
    [view presentViewController:alertController animated:YES completion:nil];
    //[budget updateLabel];

}
-(void)selectAddIncome:(UIViewController*)view{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Add Income"
                                          message:@"Please enter a label and an amount in the fields below"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Income Lable Placeholder", @"Login");
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Amount Placeholder", @"Password");
         textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
     }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   labelText = alertController.textFields.firstObject;
                                   amountText = alertController.textFields.lastObject;
                                   Income *newIncome = [[Income alloc]init];
                                   newIncome.income = amountText.text;
                                   newIncome.incomeLabel = labelText.text;
                                   NSNumberFormatter *f = [[NSNumberFormatter alloc]init];
                                   f.numberStyle = NSNumberFormatterDecimalStyle;
                                   NSNumber *holder = [f numberFromString:newIncome.income];
                                   totalIncome = @([totalIncome doubleValue] + [holder doubleValue]);
                                   [self addNewIncome:newIncome];
                                   
                               }];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
    [alertController addAction:cancelAction];

    [alertController addAction:okAction];
    [view presentViewController:alertController animated:YES completion:nil];
    //[budget updateLabel];
    
}
-(void)selectBudgetSection{
    
}

-(void)addNewSection:(Section*)newSection{
    [sections addObject:newSection];
}
-(void)addNewIncome:(Income*)newIncome{
    [income addObject:newIncome];
}

@end
