//
//  Income.m
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import "Income.h"
#import "Budget.h"



@implementation Income
@synthesize income;
@synthesize incomeLabel;

-(Income*) addIncome:(NSString*)incomeAmount withName:(NSString*)incomeLab{
    Income *newIncome = [[Income alloc]init];
    newIncome.income = incomeAmount;
    newIncome.incomeLabel = incomeLab;
    return newIncome;
}
@end

