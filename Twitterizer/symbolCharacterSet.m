//
//  ViewController.m
//  Twitterizer
//
//  Created by Mohamed Ayadi on 5/25/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()  <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *count;
@property long x;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    self.textView.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textView.autocapitalizationType= UITextAutocapitalizationTypeNone;
    return YES;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)textViewDidChange:(UITextView *)textView {

    self.x = self.textView.text.length;
    self.count.text = [NSString stringWithFormat:@"%ld", self.x];
    
    if(self.x>139)
    {

        [self.textView setEditable:NO];
    }
      
    else{
        [self.textView setEditable:YES];
        }

}


- (IBAction)hashTagButton:(id)sender {

    
    NSString *mystring= self.textView.text;
    NSMutableArray *words = [[mystring componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]mutableCopy];
    
    [words removeObject:@""];
    NSString *res = [words componentsJoinedByString:@" #"];
    
    res = [[res stringByReplacingOccurrencesOfString:@"##" withString:@"#"]mutableCopy ];
    
    if([res characterAtIndex:0] != '#')
    {
       
         res= [@"#" stringByAppendingString:res];
        
    }
    
    
    NSLog(@" %@",words);
    
   self.textView.text =res;
    
}


- (IBAction)twitterizeButton:(id)sender {
    
    NSMutableString *userInput = [[NSMutableString alloc]init];
    
    userInput = [NSMutableString stringWithFormat:@"%@",self.textView.text];
    
    
    for (int i = 0; i <self.textView.text.length; i++) {
        
        //add set later..
        userInput = [[userInput stringByReplacingOccurrencesOfString:@"a" withString:@""]mutableCopy ];
        userInput = [[userInput stringByReplacingOccurrencesOfString:@"A" withString:@""]mutableCopy ];
        userInput = [[userInput stringByReplacingOccurrencesOfString:@"i" withString:@""]mutableCopy ];
        userInput = [[userInput stringByReplacingOccurrencesOfString:@"I" withString:@""]mutableCopy ];
        userInput = [[userInput stringByReplacingOccurrencesOfString:@"u" withString:@""]mutableCopy ];
        userInput = [[userInput stringByReplacingOccurrencesOfString:@"U" withString:@""]mutableCopy ];
        userInput = [[userInput stringByReplacingOccurrencesOfString:@"e" withString:@""]mutableCopy ];
        userInput = [[userInput stringByReplacingOccurrencesOfString:@"E" withString:@""]mutableCopy ];
        userInput = [[userInput stringByReplacingOccurrencesOfString:@"o" withString:@""]mutableCopy ];
        userInput = [[userInput stringByReplacingOccurrencesOfString:@"O" withString:@""]mutableCopy ];
    }
    
    self.textLabel.text = userInput;
        
}


- (IBAction)reverseButton:(id)sender {
    NSArray* splitArr = [self.textView.text componentsSeparatedByString: @" "];
    
    NSMutableArray* modifiedArr = [splitArr mutableCopy];
    for(NSString* str in splitArr) {
        if([str containsString:@"#"])
            [modifiedArr removeObject:str];
    }
    
    NSMutableString* finalStr = [[NSMutableString alloc] init];
    for(NSString* str in modifiedArr) {
        [finalStr appendString:[NSString stringWithFormat:@"%@ ",str]];
    }


   self.textView.text =finalStr;
    NSLog(@"%@",finalStr);
    

    NSString *firstPart = self.textView.text;
    NSMutableString *secondPart = [[NSMutableString alloc]init];
    
    for ( long i=self.textView.text.length -1; i>=0; i--) {
        
        [secondPart appendFormat:@"%c", [firstPart characterAtIndex:i]];
        
    }
    
    NSLog(@"%@", secondPart);
    
    
    self.textView.text = [NSString stringWithFormat:@"%@",  secondPart];
}

@end
