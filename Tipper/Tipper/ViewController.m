//
//  ViewController.m
//  Tipper
//
//  Created by Hector Diaz on 6/26/18.
//  Copyright © 2018 Hector Diaz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControll;



@property (weak, nonatomic) IBOutlet UILabel *tipTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *symbolLabel;


@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear: animated];
    
    NSArray *currencyArray = @[@"$", @"¥", @"£"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
    NSInteger theme = [defaults integerForKey:@"theme"];
    
    NSInteger currency = [defaults integerForKey:@"currency_symbol"];
    
    self.symbolLabel.text = currencyArray[currency];

    
    if(theme == 0){
        
        self.billField.textColor = [UIColor blackColor];
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        self.tipLabel.textColor = [UIColor blackColor];
        
        self.totalLabel.textColor = [UIColor blackColor];
        
        self.totalTitleLabel.textColor = [UIColor blackColor];
        
        self.tipTitleLabel.textColor = [UIColor blackColor];
        
        self.symbolLabel.textColor = [UIColor blackColor];
        
        
    } else{
        
        self.billField.textColor = [UIColor whiteColor];
        
        self.view.backgroundColor = [UIColor blackColor];
        
        self.tipLabel.textColor = [UIColor whiteColor];
        
        self.totalLabel.textColor = [UIColor whiteColor];
        
        self.totalTitleLabel.textColor = [UIColor whiteColor];
        
        self.tipTitleLabel.textColor = [UIColor whiteColor];
        
        self.symbolLabel.textColor = [UIColor whiteColor];
        
    }

    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    
    
    NSLog(@"Tap gesture detected");
    
    [self.view endEditing:YES];
    
}
- (IBAction)onEdit:(id)sender {
    
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.1), @(0.2), @(0.3)];
    
    NSInteger tipSelection = self.tipControll.selectedSegmentIndex;
    
    double tipPercentage = 0;
    
    if(tipSelection < 3){
        
        tipPercentage = [percentages[self.tipControll.selectedSegmentIndex] doubleValue];
        
    } else {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        tipPercentage = [defaults doubleForKey:@"default_tip_percentage"];
    }
    
    double tip = tipPercentage * bill;
    
    double total = bill + tip;
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger currency = [defaults integerForKey:@"currency_symbol"];
    
    if(currency == 0){
        
        self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
        
        self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
        
    } else if(currency == 1){
        
        
        self.tipLabel.text = [NSString stringWithFormat:@"¥%.2f", tip];
        
        self.totalLabel.text = [NSString stringWithFormat:@"¥%.2f", total];
        
    } else {
        
        self.tipLabel.text = [NSString stringWithFormat:@"£%.2f", tip];
        
        self.totalLabel.text = [NSString stringWithFormat:@"£%.2f", total];
        
    }
    
    
}
- (IBAction)editingDidBegin:(id)sender {
    
    CGRect newFrame = self.billField.frame;
    
    CGRect newTipFrame = self.tipControll.frame;
    
    CGRect newTipValueFrame = self.tipLabel.frame;
    
    CGRect newTotalValueFrame = self.totalLabel.frame;
    
    CGRect newTotalTitleFrame = self.totalTitleLabel.frame;
    
    CGRect newTipTitleFrame = self.tipTitleLabel.frame;
    
    CGRect newSymbolLabel = self.symbolLabel.frame;
    
    newFrame.origin.y -= 175;
    
    newTipFrame.origin.y -= 175;
    
    newTipValueFrame.origin.y -= 175;
    
    newTotalValueFrame.origin.y -= 175;
    
    newTotalTitleFrame.origin.y -= 175;
    
    newTipTitleFrame.origin.y -= 175;
    
    newSymbolLabel.origin.y -= 175;
    
    [UIView animateWithDuration: 1 animations:^{
        
        self.tipControll.alpha = 1;
        
        self.tipLabel.alpha = 1;
        
        self.totalLabel.alpha = 1;
        
        self.totalTitleLabel.alpha = 1;
        
        self.tipTitleLabel.alpha = 1;
        
        self.billField.frame = newFrame;
        
        self.tipControll.frame = newTipFrame;
        
        self.tipLabel.frame = newTipValueFrame;
        
        self.totalLabel.frame = newTotalValueFrame;
        
        self.totalTitleLabel.frame = newTotalTitleFrame;
        
        self.tipTitleLabel.frame = newTipTitleFrame;
        
        self.symbolLabel.frame = newSymbolLabel;
        
    }];
    
}
- (IBAction)editingDidEnd:(id)sender {
    
    
    CGRect newFrame = self.billField.frame;
    
    CGRect newTipFrame = self.tipControll.frame;
    
    CGRect newTipValueFrame = self.tipLabel.frame;
    
    CGRect newTotalValueFrame = self.totalLabel.frame;
    
    CGRect newTotalTitleFrame = self.totalTitleLabel.frame;
    
    CGRect newTipTitleFrame = self.tipTitleLabel.frame;
    
    CGRect newSymbolLabel = self.symbolLabel.frame;
    
    newFrame.origin.y += 175;
    
    newTipFrame.origin.y += 175;
    
    newTipValueFrame.origin.y += 175;
    
    newTotalValueFrame.origin.y += 175;
    
    newTotalTitleFrame.origin.y += 175;
    
    newTipTitleFrame.origin.y += 175;
    
    newSymbolLabel.origin.y += 175;

    
    [UIView animateWithDuration: 1 animations:^{
        
        self.tipControll.alpha = 0;
        
        self.tipLabel.alpha = 0;
        
        self.totalLabel.alpha = 0;
        
        self.totalTitleLabel.alpha = 0;
        
        self.tipTitleLabel.alpha = 0;
        
        self.billField.frame = newFrame;
        
        self.tipControll.frame = newTipFrame;
        
        self.tipLabel.frame = newTipValueFrame;
        
        self.totalLabel.frame = newTotalValueFrame;
        
        self.totalTitleLabel.frame = newTotalTitleFrame;

        self.tipTitleLabel.frame = newTipTitleFrame;
        
        self.symbolLabel.frame = newSymbolLabel;
        
    }];
    
    
}

@end
