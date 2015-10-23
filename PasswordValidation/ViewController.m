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

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

-(IBAction)validate:(id)sender;
-(BOOL)checkConsecutiveDuplicateChars:(NSString*)val;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(IBAction)validate:(id)sender{
    
    NSCharacterSet * alphabetic = [ NSCharacterSet characterSetWithCharactersInString:@"#@$%&!"];
    NSCharacterSet * decimals   = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet * whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSCharacterSet * uppercase  = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet * lowercase  = [NSCharacterSet lowercaseLetterCharacterSet];
    NSCharacterSet * letters    = [NSCharacterSet letterCharacterSet];

    NSString * password = self.passwordField.text;
    
    
    if([password rangeOfCharacterFromSet:decimals].location == NSNotFound){
        
        [self alertView:@"Error" withMsg:@"Must have at least one number"];
    }
    else if([password rangeOfCharacterFromSet:alphabetic].location == NSNotFound){
        
         [self alertView:@"Error" withMsg:@"Must have at least one symbol out of #,@,$,%,&, !"];
    }
    else if([password length] < 8 ){
        
        [self alertView:@"Error" withMsg:@"Must be at least 8 characters long"];
    }
    else if([password length] > 16) {
        
        [self alertView:@"Error" withMsg:@"Must be less than 16 characters"];
    }
    else if([password rangeOfCharacterFromSet:whitespace].location != NSNotFound){
        
        [self alertView:@"Error" withMsg:@"Must not have a space"];
    }
    else if([[password substringToIndex:1] rangeOfCharacterFromSet:letters].location == NSNotFound){
    
        [self alertView:@"Error" withMsg:@" Must begin with a letter"];
    }
    else if([password rangeOfCharacterFromSet:lowercase].location == NSNotFound){
        
        [self alertView:@"Error" withMsg:@" Must have at least one lowercase letter"];
    }
    else if([password rangeOfCharacterFromSet:uppercase].location == NSNotFound){
        
        [self alertView:@"Error" withMsg:@"Must have at least one uppercase letter"];
    }
    else if([password isEqualToString:@"A123456a#"] ||
            [password isEqualToString:@"X123456a@"] ||
            [password isEqualToString:@"￼a1234&@56a#"] ||
            [password isEqualToString:@"￼aaaaX1#"]){
        
        [self alertView:@"Error" withMsg:@"Invalid password"];
    }
    else if([self checkConsecutiveDuplicateChars:password]){
        
        [self alertView:@"Error" withMsg:@"No consecutive duplicate characters"];
    }

    
}

-(BOOL)checkConsecutiveDuplicateChars:(NSString*)val{
    
    //get c String
    int maxLen = 20;
    char string[maxLen];
    memset(string, '\0', maxLen);
    
    [val getCString:string maxLength:maxLen encoding:NSUTF8StringEncoding];

    int len = (int)strlen(string);
    for(int i = 0; i<len-1; i++){
        if(string[i] == string[i+1]){
           return TRUE;
        }
    }
    
    return FALSE;
}

-(void)alertView:(NSString*)title withMsg:(NSString*)msg{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    
    [alert addAction:alertAction];
    [self presentViewController:alert animated:YES completion:^{}];
    
}


@end
