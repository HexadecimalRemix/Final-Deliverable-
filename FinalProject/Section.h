//
//  Section.h
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Section :  UIViewController <NSObject, UIAlertViewDelegate, UITableViewDelegate, UITableViewDataSource> {
    NSString *sectionLabel;
    NSString  *sectionAmount;
    NSMutableArray *expenses;
}
- (instancetype)initWithObject:(Section*)thisSection;
@property(nonatomic, readwrite) NSMutableArray *expenses;
@property(nonatomic, readwrite) NSString *sectionLabel;
@property(nonatomic, readwrite) NSString *sectionAmount;
@end
