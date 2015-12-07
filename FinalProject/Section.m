//
//  Section.m
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import "Section.h"
#import "Expenses.h"

@interface Section()
    @property (weak, nonatomic) IBOutlet UITableView *expenseScroll;
@property (weak, nonatomic) IBOutlet UILabel *expenseAdded;
@property (weak, nonatomic) IBOutlet UILabel *expenseNet;
@property (weak, nonatomic) IBOutlet UILabel *expenseAllow;
@end

@implementation Section
@synthesize expenses;
@synthesize sectionAmount;
@synthesize sectionLabel;

UITextField *labelTextin;
UITextField *expenseText;
Section *mySection;

- (instancetype)initWithObject:(Section*)thisSection{
    if ((self = [super init])) {
        //mySection = thisSection;
    }
    return self;
}
- (id)init
{
    self = [super init];
    if (self)
    {
        expenses = [[NSMutableArray alloc]init];
        sectionAmount = 0;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refreshPropertyList:)];
    self.navigationItem.rightBarButtonItem = anotherButton;

    // Do any additional setup after loading the view.
}
-(IBAction)refreshPropertyList:(id)sender{
    [self.expenseScroll reloadData];
    [self loadLabels];
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationItem.title = @"Section Menu";
    self.expenseScroll.contentInset = UIEdgeInsetsMake(-56, 0, 0, 0);
    [super viewWillAppear:YES];
    [self loadLabels];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadLabels{
    if(sectionAmount){
    _expenseAllow.text = [NSString stringWithFormat:@"Sections Allowance: $%@", sectionAmount];
    }
    if([self getExpenseTotal]){
    _expenseAdded.text = [NSString stringWithFormat:@"Section Expense: $%@", [self getExpenseTotal]];
    }
    NSNumberFormatter *f = [[NSNumberFormatter alloc]init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *sum = @([sectionAmount doubleValue] - [[self getExpenseTotal] doubleValue]);
    if ([sum doubleValue] < 0){
        [self notifyUser];
    }
    _expenseNet.text = [NSString stringWithFormat:@"Available Allowance: $%@", sum];
}
-(void)notifyUser{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"You have gone over this sections allowance. Please make more money or spend less." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
}
-(NSNumber*)getExpenseTotal{
    NSNumber *total = [[NSNumber alloc]init];
    for (int x = 0; x < [expenses count]; x++){
        Expenses *currentEx = [expenses objectAtIndex:x];
        NSNumberFormatter *f = [[NSNumberFormatter alloc]init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *holder = [f numberFromString:currentEx.expense];
        total = @([holder doubleValue] + [total doubleValue]);
    }
    return total;
}
-(IBAction)addExpense{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Add Expense"
                                          message:@"Fill in the fields below"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Expense Lable Placeholder", @"Login");
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Expense Amount Placeholder", @"Password");

     }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   labelTextin = alertController.textFields.firstObject;
                                   expenseText = alertController.textFields.lastObject;
                                   Expenses *apple = [[Expenses alloc]init];
                                   apple = [apple addNewExpense:expenseText.text initWithLabel:labelTextin.text];
                                   [self inputExpense:apple];
                               }];
    UIAlertAction *cancelAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Cancel", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                  
                               }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    [self loadLabels];
    [self.expenseScroll reloadData];
    
}
    

-(void)inputExpense:(Expenses*)newExpense{
    [expenses addObject:newExpense];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [expenses count];    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSArray *sectionArray = expenses;
    Expenses *currentSection = [sectionArray objectAtIndex:indexPath.row];
    NSString *currentValue = currentSection.expeseLabel;
    //[[cell textLabel]setText:currentValue];
    NSString* myNewString = [NSString stringWithFormat:@"%@:      $%@", currentValue, currentSection.expense];
    cell.textLabel.text = myNewString;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Expense List";
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
