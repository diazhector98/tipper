//
//  SettingsViewController.m
//  Tipper
//
//  Created by Hector Diaz on 6/26/18.
//  Copyright © 2018 Hector Diaz. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *defaultTipField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *currencySymbolControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *themeControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    double defaultTipPercentage = [defaults doubleForKey:@"default_tip_percentage"];
    
    NSInteger theme = [defaults integerForKey:@"theme"];
    
    NSInteger currency = [defaults integerForKey:@"currency_symbol"];
    
    self.defaultTipField.text = [NSString stringWithFormat:@"%.2f", defaultTipPercentage];
    
    self.themeControl.selectedSegmentIndex = theme;
    
    self.currencySymbolControl.selectedSegmentIndex =  currency;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)viewTapped:(id)sender {
    
    [self.view endEditing: YES];
    
}

- (IBAction)saveSettings:(id)sender {
    
    double defaultTip = [self.defaultTipField.text doubleValue];
    
    NSInteger symbolSelected = self.currencySymbolControl.selectedSegmentIndex;
    
    NSInteger themeSelected = self.themeControl.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setDouble:defaultTip forKey:@"default_tip_percentage"];
    
    [defaults setInteger:symbolSelected forKey:@"currency_symbol"];
    
    [defaults setInteger:themeSelected forKey:@"theme"];
    
    [defaults synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}


@end
