//
//  Income.h
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Income : NSObject {
    NSString *income;
    NSString *incomeLabel;
    
}
-(Income*)addIncome:(NSString*)incomeAmount withName:(NSString*)incomeLab;
@property(nonatomic, readwrite) NSString *income;
@property(nonatomic, readwrite) NSString *incomeLabel;
@end
