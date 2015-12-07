//
//  BudgetControllerViewController.m
//  FinalProject
//
//  Created by Pearce Mulkin on 12/5/15.
//  Copyright © 2015 mulkin. All rights reserved.
//

#import "BudgetControllerViewController.h"
#import "Budget.h"



@interface BudgetControllerViewController()
@property (weak, nonatomic) IBOutlet UITableView *sectionScroll;
@property (weak, nonatomic) IBOutlet UILabel *totalIn;
@property (weak, nonatomic) IBOutlet UILabel *totalEx;
@property (weak, nonatomic) IBOutlet UILabel *totalAv;
@end
@interface BudgetControllerViewController ()

@end

@implementation BudgetControllerViewController

int tableViewCheck = 0;
- (instancetype)initWithObject:(Budget *)thisBudget{
    if ((self = [super init])) {
        myBudget = thisBudget;
        //[myBudget setBudget:self];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Budget Menu";
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refreshPropertyList:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
   // [anotherButton release];
    [self.sectionScroll reloadData];
    // Do any additional setup after loading the view.
}

-(IBAction)refreshPropertyList:(id)sender{
    [self.sectionScroll reloadData];
    [self updateLabel];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.sectionScroll setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self updateLabel];
    [super viewWillAppear:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self saveCustomObject:myBudget key:@"budgetKey1"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addIncome:(id)sender{
    [myBudget selectAddIncome:self];
    [self.sectionScroll reloadData];
    [self viewDidLoad];
}
-(IBAction)addBudgetSection:(id)sender{
    [myBudget selectAddBudgetSection:self];
    [self.sectionScroll reloadData];
}
-(IBAction)viewIncome:(id)sender{
    tableViewCheck = 1;
    self.sectionScroll.backgroundColor = [UIColor colorWithRed:15.0f/255.0f green:133.0f/255.0f blue:202.0f/255.0f alpha:1.0f];
    [self.sectionScroll reloadData];
}
-(IBAction)viewSections:(id)sender{
    self.sectionScroll.backgroundColor = [UIColor colorWithRed:104.0f/255.0f green:195.0f/255.0f blue:254.0f/255.0f alpha:1.0f];
    tableViewCheck = 0;
    [self.sectionScroll reloadData];
}

-(void)refreshData{
    [self.sectionScroll reloadData];
}
-(void)updateLabel{
    if(myBudget.totalIncome){
    _totalIn.text = [NSString stringWithFormat:@"Total Income: $%@", myBudget.totalIncome];
    }
    if([self getTotalExpense]){
    _totalEx.text = [NSString stringWithFormat:@"Total Expenses: $%@", [self getTotalExpense]];
    }
    NSNumberFormatter *f = [[NSNumberFormatter alloc]init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *sum = @([myBudget.totalIncome doubleValue] - [[self getTotalExpense] doubleValue]);
    if ([sum doubleValue] < 0){
        [self notifyUser];
    }
    _totalAv.text = [NSString stringWithFormat:@"Total Available Funds: $%@", sum];
}
-(void)notifyUser{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"You have have gone over budget. Make more money or spend less." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];

}
-(NSNumber*)getTotalExpense{
    NSNumber *collectiveValue = [[NSNumber alloc]init];
    for(int x = 0; x < [myBudget.sections count]; x++){
        Section *currentSect = [myBudget.sections objectAtIndex:x];
        for(int y = 0; y < [currentSect.expenses count]; y++){
            Expenses *currentEx = [currentSect.expenses objectAtIndex:y];
            NSNumberFormatter *f = [[NSNumberFormatter alloc]init];
            f.numberStyle = NSNumberFormatterDecimalStyle;
            NSNumber *holder = [f numberFromString:currentEx.expense];
            collectiveValue = @([holder doubleValue] + [collectiveValue doubleValue]);
        }
    }
    return collectiveValue;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableViewCheck == 1){
        return [myBudget.income count];
    }else{
        return [myBudget.sections count];
    }
    return nil;
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *cellIdentifier = @"cell";
    //TableCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//    }
//    static NSString *simpleTableIdentifier = @"TableCell";
    
//    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if (cell == nil) {
//        //NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
//       // cell = [nib objectAtIndex:0];
//        cell = [[TableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//        
//    }
    NSString *cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }

    if (tableViewCheck == 1){
    NSArray *incomeArray = myBudget.income;
    Income *currentIncome = [incomeArray objectAtIndex:indexPath.row];
    NSString *currentValue = currentIncome.incomeLabel;
    NSString* myNewString = [NSString stringWithFormat:@"%@:                                    +$%@", currentValue, currentIncome.income];
        //cell.amount.text = currentIncome.income;
        //cell.label.text = currentValue;
    [[cell textLabel]setText:myNewString];
    }
    else{
    NSArray *sectionArray = myBudget.sections;
    Section *currentSection = [sectionArray objectAtIndex:indexPath.row];
    NSString *currentValue = currentSection.sectionLabel;
    NSString* myNewString = [NSString stringWithFormat:@"%@:                                      $%@", currentValue, currentSection.sectionAmount];
        //cell.amount.text = currentSection.sectionAmount;
        //cell.label.text = currentValue;
    [[cell textLabel]setText:myNewString];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableViewCheck ==0){
    [self.navigationController pushViewController:[myBudget.sections objectAtIndex:indexPath.row] animated:YES];
    }
}
- (void)saveCustomObject:(Budget *)object key:(NSString *)key {
    
    NSData *myObjectData  = [NSData dataWithBytes:(void *)&object length:sizeof(object)];
    [[NSUserDefaults standardUserDefaults] setObject:myObjectData forKey:key];
//    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:encodedObject forKey:key];
//    [defaults synchronize];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableViewCheck ==1){
    return @"Income List";
    }
    return @"Budget Sections";
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
