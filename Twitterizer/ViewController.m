//
//  ViewController.m
//  Twitterizer
//
//  Created by Mohamed Ayadi on 5/25/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Success!");
}

- (IBAction)hashTagButton:(id)sender {
}

- (IBAction)twitterizeButton:(id)sender {
    
    NSString *userInput = self.textField.text;
    
    for (int i = 0; i <self.textField.text.length; i++) {
        
       
        if([userInput characterAtIndex:i] == @"a")
        {
            (NSString *))userInput[i] =@"";
            
        }
        
        
        
        
        
    }
    
    //self.textLabel.text = userInput;
    
    
}

- (IBAction)reverseButton:(id)sender {
}

@end
