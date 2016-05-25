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

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Success!");
}


-(void)textViewDidChange:(UITextView *)textView{
    
    long x=self.textView.text.length;
    
    NSLog(@"%lu", x);
    
    
}
- (IBAction)hashTagButton:(id)sender {
}

- (IBAction)twitterizeButton:(id)sender {
    
    
    NSString *userInput = self.textView.text;
    
    for (int i = 0; i <self.textView.text.length; i++) {
        

        userInput=[[userInput stringByReplacingOccurrencesOfString:@"a" withString:@""]mutableCopy ];
        userInput=[[userInput stringByReplacingOccurrencesOfString:@"i" withString:@""]mutableCopy ];
        userInput=[[userInput stringByReplacingOccurrencesOfString:@"u" withString:@""]mutableCopy ];
        userInput=[[userInput stringByReplacingOccurrencesOfString:@"e" withString:@""]mutableCopy ];
    }
        
    
    self.textLabel.text = userInput;
    
        
        
}

    
    


- (IBAction)reverseButton:(id)sender {
}

@end
