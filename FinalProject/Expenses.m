//
//  Expenses.m
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import "Expenses.h"
#import "Section.h"

@implementation Expenses
@synthesize expense;
@synthesize expeseLabel;


-(Expenses*)addNewExpense:(NSString*)expenseIn initWithLabel:(NSString*)label{
   
    Expenses *newExpense = [[Expenses alloc]init];
    newExpense.expense = expenseIn;
    newExpense.expeseLabel = label;
    return newExpense;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
