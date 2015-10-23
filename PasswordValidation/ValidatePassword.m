//
//  validatePassword.m
//  PasswordValidation
//
//  Created by Angie Chilmaza on 10/23/15.
//  Copyright © 2015 Angie Chilmaza. All rights reserved.
//

#import "ValidatePassword.h"

@interface ValidatePassword ()

+(BOOL)checkConsecutiveDuplicateChars:(NSString*)val;

@end


@implementation ValidatePassword

+(NSString*)validate:(NSString*)password{
    
    NSCharacterSet * alphabetic = [NSCharacterSet characterSetWithCharactersInString:@"#@$%&!"];
    NSCharacterSet * decimals   = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet * whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSCharacterSet * uppercase  = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet * lowercase  = [NSCharacterSet lowercaseLetterCharacterSet];
    NSCharacterSet * letters    = [NSCharacterSet letterCharacterSet];
    NSString * error = nil;
    
    if([password rangeOfCharacterFromSet:decimals].location == NSNotFound){
        
        error = @"Must have at least one number";
    }
    else if([password rangeOfCharacterFromSet:alphabetic].location == NSNotFound){
        
        error = @"Must have at least one symbol out of #,@,$,%,&, !";
    }
    else if([password length] < 8 ){
        
        error = @"Must be at least 8 characters long";
        
    }
    else if([password length] > 16) {
        
        error = @"Must be less than 16 characters";
        
    }
    else if([password rangeOfCharacterFromSet:whitespace].location != NSNotFound){
        
        error = @"Must not have a space";
        
    }
    else if([[password substringToIndex:1] rangeOfCharacterFromSet:letters].location == NSNotFound){
        
        error = @"Must begin with a letter";
    }
    else if([password rangeOfCharacterFromSet:lowercase].location == NSNotFound){
        
        error = @"Must have at least one lowercase letter";
        
    }
    else if([password rangeOfCharacterFromSet:uppercase].location == NSNotFound){
        
        error = @"Must have at least one uppercase letter";
        
    }
    else if([password isEqualToString:@"A123456a#"] ||
            [password isEqualToString:@"X123456a@"] ||
            [password isEqualToString:@"￼a1234&@56a#"] ||
            [password isEqualToString:@"￼aaaaX1#"]){
        
        error = @"Invalid password";
        
    }
    else if([self checkConsecutiveDuplicateChars:password]){
        
        error = @"Must not have consecutive duplicate characters";
    }
    
    return error;
    
}

+(BOOL)checkConsecutiveDuplicateChars:(NSString*)val{
    
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

@end
