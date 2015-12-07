//
//  BudgetControllerViewController.h
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Budget.h"
#import "Section.h"
#import "Expenses.h"
#import "Income.h"


@interface BudgetControllerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    Budget *myBudget;
}


-(void)updateLabel;
- (instancetype)initWithObject:(Budget *)thisBudget;
@end
