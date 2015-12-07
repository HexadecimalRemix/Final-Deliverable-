//
//  Expenses.h
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Expenses : NSObject {
    
    NSString *expense;
    NSString *expeseLabel;
}

-(Expenses*)addNewExpense:(NSString*)expenseIn initWithLabel:(NSString*)label;
@property(nonatomic, readwrite) NSString *expense;
@property(nonatomic, readwrite) NSString *expeseLabel;
@end
