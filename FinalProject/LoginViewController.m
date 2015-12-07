
#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    CGRect frame = [[UIScreen mainScreen] bounds];
    LoginView *v = [[LoginView alloc] initWithFrame:frame];
    [v setBack:self];
    [self setView:v];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)authenticateHandler:(NSNotification *)notification {
//    NSLog(@"[LoginViewController] Authenticate handler");
//    
//    NSDictionary *userDict = [notification userInfo];
//    
//    BOOL isUserAuthenticated = [username isEqualToString:[userDict objectForKey:@"username"]] &&
//    [password isEqualToString:[userDict objectForKey:@"password"]];
//    
//    [[NSUserDefaults standardUserDefaults] setBool:isUserAuthenticated forKey:@"userLoggedIn"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    
//    if( isUserAuthenticated ){
//        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//    }else{
//        LoginView *v = (LoginView *)self.view;
//        [v showAlert];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"[LoginViewController] Dealloc");
}

@end
