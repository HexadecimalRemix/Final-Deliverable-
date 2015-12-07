//


#import "LoginView.h"
#import "LoginViewController.h"

@implementation LoginView

@synthesize background = _background;
@synthesize txtUsername = _txtUsername;
@synthesize txtPassword = _txtPassword;
@synthesize btnLogin = _btnLogin;
LoginViewController *back;
- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    
    if (self) {
        NSLog(@"[LoginView] Init");
        self.backgroundColor = [UIColor colorWithRed:62/255.0 green:69/255.0 blue:76/255.0 alpha:1];
        
        [self createBackground];
        [self createUsernameTextField];
        [self createPasswordTextField];
        [self createLoginButton];
    }
    
    return self;
}

- (void)createBackground {
    //UIImage *image = [ImageFactory createImageWithPathForResource:@"login_frame_background" ofType:@"png" inDirectory:@"images"];
    UIImage *image = [UIImage  imageNamed:@"login_frame_background"];
    self.background = [[UIImageView alloc] initWithImage:image];
    self.background.frame = CGRectMake(15, 170, image.size.width, image.size.height);
    [self addSubview:self.background];
}

- (void)createUsernameTextField {
    self.txtUsername = [[UITextField alloc] initWithFrame:CGRectMake(35, 230, 250, 30)];
    self.txtUsername.placeholder = @"e-mail";
    [self addSubview:self.txtUsername];
}

- (void)createPasswordTextField {
    self.txtPassword = [[UITextField alloc] initWithFrame:CGRectMake(35, 275, 250, 30)];
    self.txtPassword.secureTextEntry = YES;
    self.txtPassword.placeholder = @"password";
    [self addSubview:self.txtPassword];
}

- (void)createLoginButton {
    //UIImage *image = [ImageFactory createImageWithPathForResource:@"login_button" ofType:@"png" inDirectory:@"images"];
    UIImage *image = [UIImage imageNamed:@"login_button"];
    self.btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogin.frame = CGRectMake(30, 315, image.size.width, image.size.height);
    [self.btnLogin setBackgroundImage:image forState:UIControlStateNormal];
    [self.btnLogin addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnLogin];
}
#define username @"pearce"
#define password @"comp3700"
- (void)loginButtonClicked:(id)sender {
    NSLog(@"[LoginView] Login button clicked");
    [self hideKeyboard];
    BOOL isUserAuthenticated = [username isEqualToString:self.txtUsername.text] &&
    [password isEqualToString:self.txtPassword.text];
    if (isUserAuthenticated){
        [back.navigationController popViewControllerAnimated:YES];
    }
    else{
        [self showAlert];
    }
}
//    NSDictionary *loginDict = [NSDictionary dictionaryWithObjectsAndKeys:self.txtUsername.text, @"username", self.txtPassword.text, @"password", nil];
-(void)setBack:(LoginViewController*)view
    {
        back = view;
    }


- (void)hideKeyboard {
    [self.txtUsername resignFirstResponder];
    [self.txtPassword resignFirstResponder];
}

- (void)showAlert {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid" message:@"Username or password was not correct" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.txtUsername.text = @"";
    self.txtPassword.text = @"";
}

- (void)dealloc {
    NSLog(@"[LoginView] Dealloc");
}

@end
