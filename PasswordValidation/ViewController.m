//
//  ViewController.m
//  PasswordValidation
//
//  Created by Angie Chilmaza on 10/23/15.
//  Copyright © 2015 Angie Chilmaza. All rights reserved.
//

// Password validation
//
// Must have at least one number
// Must have at least one symbol out of #,@,$,%,&, !
// Must be at least 8 characters long
// Must be less than 16 characters
// Must not have a space
// Must begin with an alphabet
// Must have at least one lowercase letter
// Must have at least one uppercase letter
// Must not be from a common list of words given below. You should be able to
// add words to this list and check if the list indeed works.
// Optional: Must not have any repeating characters i.e. aa123456a@ is not ok but
// a123456a@ is ok.
// 
// ￼A123456a#
// ￼X123456a@
// ￼a1234&@56a#
// ￼aaaaX1#



#import "ViewController.h"
#import "ValidatePassword.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *passwordField;
-(IBAction)validate:(id)sender;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(IBAction)validate:(id)sender{
    
    NSString * password = self.passwordField.text;
    NSString * error = [ValidatePassword validate:password];
        
    if(error){
        [self alertView:@"Error" withMsg:error];
    }
    else{
        [self alertView:@"" withMsg:@"Valid password"];
    }
        
}


-(void)alertView:(NSString*)title withMsg:(NSString*)msg{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    
    [alert addAction:alertAction];
    [self presentViewController:alert animated:YES completion:^{}];
    
}


@end
