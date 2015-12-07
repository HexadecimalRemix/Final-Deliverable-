

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"

@interface LoginView : UIView

@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) UITextField *txtUsername;
@property (nonatomic, strong) UITextField *txtPassword;
@property (nonatomic, strong) UIButton *btnLogin;

- (void)showAlert;
-(void)setBack:(LoginViewController*)view;
@end
